#include "fat_internal.h"
#include <iostream>
#include <fcntl.h>
#include <unistd.h>

int fd;
Fat32BPB BPB;
uint32_t FAT;           // the file allocation table
int FirstDataSector;    // the first sector that contains data
int clusterSize;        // the sector size * # of sectors per cluster
int RootDirSectors;     // root directory sectors

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

*/
bool fat_mount(const std::string &path) {
    // * open the provided path to the disk image (e.g. testdisk1.raw)
    if((fd = open(path.c_str(), O_RDWR)) < 0) {
        std::cerr << "Failed to open disk image" << std::endl;
        return false;
    }
    if((read(fd, &BPB, sizeof(Fat32BPB))) < 0 ) {
        std::cerr << "Failed to read Fat32BPB" << std::endl;
        return false;
    }
    std::cout << "ROOT CLUSTER: " << BPB.BPB_RootClus << std::endl;

    // * Taken from page 13-14 of MS's FAT32 Documentation
    RootDirSectors = ((BPB.BPB_rootEntCnt * 32) + (BPB.BPB_BytsPerSec - 1)) / BPB.BPB_BytsPerSec;
    FirstDataSector = BPB.BPB_RsvdSecCnt + (BPB.BPB_NumFATs * BPB.BPB_FATSz32) + RootDirSectors;
    clusterSize = BPB.BPB_BytsPerSec * BPB.BPB_SecPerClus;
    return true;
}

int fat_open(const std::string &path) {
    return -1;
}

bool fat_close(int fd) {
    return false;
}

int fat_pread(int fd, void *buffer, int count, int offset) {
    return -1;
}

std::vector<AnyDirEntry> fat_readdir(const std::string &path) {
    std::vector<AnyDirEntry> result;
    return result;
}


