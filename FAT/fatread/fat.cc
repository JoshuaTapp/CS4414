#include "fat_internal.h"


FILE *image;
struct Fat32BPB *BPB;
uint32_t *FAT;           // the file allocation table
std::vector<FAT_fd> fd_list(128, FAT_fd{nullptr, 0, 0, true});
/*
    Formula to get the first sector of cluster N
    ? FirstSectorofCluster = ((N – 2) * BPB_SecPerClus) + FirstDataSector;
    
    Formula to compute the entry in FAT for cluster N
    ? FATOffset = N * 4;
    
    Formula to find sector number in FAT sector that contains entry for cluster N
    ? ThisFATSecNum = BPB_ResvdSecCnt + (FATOffset / BPB_BytsPerSec);
    
    offset for entry w.r.t ThisFATSecNum
    REM: remainder / modulus
    ? ThisFATEntOffset = REM(FATOffset / BPB_BytsPerSec);
    
    Put these above 2 to get the value with this,
    Where SecBuff is a byte array created from reading ThisFATSecNum
    ? FAT32ClusEntryVal = (*((DWORD *) &SecBuff[ThisFATEntOffset])) & 0x0FFFFFFF;

    Formula to get total count of sectors in the data region for FAT32
    ? TotalDataSectors = BPB_TotSec32 - (BPB_ResvdSecCnt + (BPB_NumFATs * BPB_FATSz32))
    
    


    ! Cluster and Sector numbers are uint32_t
    ! each sector can be though of as uint8_t[]


    ! FAT32 Directory Entry Notes
        * if DIR_NAME[0] == 0xE5  => NO FILE/DIRECTORY = FREE to use
        * if DIR_NAME[0] == 0x00  => FREE and NOTHING after this entry (so dont look past this)
        * DIR_NAME[11] = 8 char file name + 3 char extension (padded in middle) (e.g. foo.bar => "FOO_____BAR", abigfile.txt => "ABIGFILETXT") 
        * USE DirEntry Attributes to determine if directory or file. DIRECTORY = 0x10
            * DIR_FileSize is always set to zero  
            * Every Directory besides ROOT has 2 DirEntries of ".________" and ".._______"
                * "." first cluster = this dir's 1st cluster # (self)
                * ".." first cluster = the parent's dir's 1st cluster # (parent)
        * $ % ' - _ @ ~ ` ! ( ) { } ^ # & chars are not allows in names
        * ALL file names are case insensitive
        * DIRs cannot be larger than 2^16 * 32 bytes (2MB) 
    
    ! How to set up FAT to be easy to use
        ! REMEMBER FAT does addressing by CLUSTER NUMBER
        * Load the whole FAT[] into memory (could be multiple clusters)
        * Calculate the index in FAT by doing the following w.r.t ClusterNum: N
            ? uint32_t NextClusterNumber = FATentry(N) = (FAT[N*4 % BPB_BytsPerSec] & 0x0FFFFFFF)
        * Sector Address w.r.t Cluster N
            ? (N - 2) * BPB_SecPerClus + DataSectorStart
        
*/

// Since we are doing FAT32, this will be the cluster AFTER FAT Area
// This value ALWAYS corresponds to the first sector of CLUSTER 2 
uint32_t getFirstDataSector() {
    // Reserved Section's Sector Count
    uint reservedArea = BPB->BPB_RsvdSecCnt; 
    // FAT Sector Count = Sectors in 1 FAT * num of FATs
    uint fatArea = (BPB->BPB_FATSz32 * BPB->BPB_NumFATs); 

    return reservedArea + fatArea;
}

bool readBPB() {
    // returns false on failure to read
    fseek(image, 0, SEEK_SET); // makes sure we start at beginning of file
    return (fread(BPB, sizeof(struct Fat32BPB), 1, image) == 1);
}

bool readFat() {
    FAT = (uint32_t*) malloc(BPB->BPB_BytsPerSec * BPB->BPB_FATSz32); // size of FAT DS
    return readSectors(FAT, BPB->BPB_RsvdSecCnt, BPB->BPB_FATSz32);
}

uint32_t getNextClusterFromFAT(uint32_t cluster) {
    return FAT[cluster] & 0x0FFFFFFF;
}


// reads the data into buffer from image[sectorNum : (sectorNum * sectorCount) ]
bool readSectors(void* buffer, uint32_t sectorNum, uint sectorCount) {
    int success = fseek(image, sectorNum * BPB->BPB_BytsPerSec, SEEK_SET);

    if(success == -1) {
        perror("Failed to seek in readSectors: ");
        return false;
    }

    success = fread(buffer, BPB->BPB_BytsPerSec, sectorCount, image);

    if(success != (int) sectorCount) {
        perror("Failed to read in readSectors: ");
        return false;
    }

    return true;
}

bool readCluster(uint32_t cluster, void* buffer)
{
    // Because our file is sector addressed, we have to convert the 
    // cluster into a sector num and then read it.
    uint32_t dataAreaStartSector = getFirstDataSector();
    uint32_t clusterStartSector = (cluster - 2) * BPB->BPB_SecPerClus + dataAreaStartSector;

    // ! REMEMBER TO CHANGE THIS WHEN YOU IMPLEMENT pread()
    return readSectors(buffer, clusterStartSector, BPB->BPB_SecPerClus);
}

// Same as readCluster, but to read a directory
// TODO: Add next cluster fetching for after part 2
std::vector<DirEntry> readDirCluster(uint32_t cluster) {
    std::vector<DirEntry> dir;
    std::vector<uint32_t> clusters;
    uint32_t nextCluster = cluster; 
    
    // create buffe and write cluster contents to it
    uint32_t clusterSize = (BPB->BPB_SecPerClus) * (BPB->BPB_BytsPerSec);
    uint32_t bufferSize = clusterSize * sizeof(uint8_t*);
    uint8_t *clusterBuffer = (uint8_t *) malloc(bufferSize);

    do
    {
        clusters.push_back(nextCluster);
        nextCluster = getNextClusterFromFAT(nextCluster);
    } while (nextCluster < 0x0FFFFFF8);
        
    // TODO: dir building for multi-cluster DirEntries
    for(uint32_t c : clusters) {
        if(readCluster(c, clusterBuffer) == false) {
            perror("Failed to read dir cluster: ");
            free(clusterBuffer);
            return dir;
        }   
    
        // go through buffer and create dirEntry (every 32B)
        for(uint32_t i = 0; i < clusterSize; i += 32 ) {
            if(clusterBuffer[i] == 0x00)
                break;
            // * if Dir_Name[0] == 0xE5, nothing there
            if(clusterBuffer[i] != 0xE5) {
                DirEntry dirEntry = *( (DirEntry *) &clusterBuffer[i]);
                dir.push_back(dirEntry);
            }
        }
    }
    
    free(clusterBuffer);
    return dir;
}

bool fat_mount(const std::string &path)
{
    // * open the provided path to the disk image (e.g. testdisk1.raw)

    if ((image = fopen(path.c_str(), "r+")) == NULL)
    {
        perror("Failed to open disk image: ");
        return false;
    }

    /* =============== READ BPB =============== */
    BPB = (Fat32BPB*) (malloc(sizeof(Fat32BPB)));
    // if the size of data placed into BPB != sizeof(FAT42BPB), fails
    if (readBPB() == false)
    {
        free(BPB);
        perror("Failed to read BPB: ");
        return false;
    }
    printBPB(); // printing out image BPB data for sanity chesk
   
    /* ============== READ FAT =============== */
    FAT = (uint *) malloc(BPB->BPB_FATSz32 * BPB->BPB_BytsPerSec);
    if(readFat() == false) {
        free(FAT);
        perror("Failed to read FAT: ");
        return false;
    }
    return true;
}

int fat_open(const std::string &path)
{
    if(image == NULL)
        return -1;
    
    return -1;
}

bool fat_close(int fd)
{
    return false;
}

int fat_pread(int fd, void *buffer, int count, int offset)
{
    return -1;
}


// error: return empty vector
// return vector directory entries for directory from path
std::vector<AnyDirEntry> fat_readdir(const std::string &path)
{
    std::vector<AnyDirEntry> result;
    
    if(image != NULL) {    

        std::vector<DirEntry> dirEntries = readDirCluster(BPB->BPB_RootClus);
        for(DirEntry d : dirEntries) {
            AnyDirEntry anyDir;
            anyDir.dir = d;
            result.push_back(anyDir);
        }
    }
    
    return result;
}

void printBPB()
{
    const char *text =  "________________BPB INFO__________________\n"
                        "BytesPerSec: \t%i\n" // uint16
                        "SecPerClus: \t%i\n"  // uint8
                        "RsvdSecCnt: \t%i\n"  // uint16
                        "TotalSectors: \t%i\n"
                        "TotalClusters: \t%i\n"
                        "NumFATs: \t%i\n"     // uint8
                        "rootEntCnt: \t%i\n"  // uint16
                        "FATSz32: \t%i\n"     // uint32
                        "ExtFlags: \t%i\n"    // uint16
                        "RootClus: \t%i\n"    // uint32
                        "FirstDataSec: \t%i\n"
                        "clusterSize: \t%i\n"
                        "__________________________________________\n";
    printf(text,     
            (BPB->BPB_BytsPerSec),
            (BPB->BPB_SecPerClus),
            (BPB->BPB_RsvdSecCnt),
            (BPB->BPB_TotSec32),
            ((BPB->BPB_TotSec32) / (BPB->BPB_SecPerClus)),
            (BPB->BPB_NumFATs),
            (BPB->BPB_rootEntCnt),
            (BPB->BPB_FATSz32),
            (BPB->BPB_ExtFlags),
            (BPB->BPB_RootClus),
            (getFirstDataSector()),
            (BPB->BPB_BytsPerSec * BPB->BPB_SecPerClus)
            );
}
