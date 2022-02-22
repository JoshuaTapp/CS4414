#include <cstdlib>
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <sstream>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <cerrno>
#include <cstring>
#include <sys/stat.h> 
#include <fcntl.h>


std::vector<std::string> opers = { "<", ">", "|"}; 

struct cmd {
    std::vector<char*> cmdList;
    char* readPath = NULL; 
    char* writePath = NULL;
    pid_t pid = -1;
};

int validCommand(std::vector<std::string> &tokens) {
    int words = 0;
    int redir = 0;
    int redirFlag = 0;
    for(auto it = tokens.begin(); it != tokens.end(); ++it) {
        for(auto &str : opers) {
            if(*it == str){
                if(redirFlag != 0) return -1;
                redir++;
                redirFlag = 1;
                goto foundOp; // if we found an operator, break out of inner loop into the outer loop
            }
        }
        redirFlag = 0; // either had redir and have word, or 2+ words in row. either way, reset flag.
        words++;
        foundOp:
            continue;
    }

    if((words - redir) < 1) return -1;  // error if more redirs than words, need at least 1 more (command)
    if(redirFlag == 1) return -1; // redir with no following word, error.
    for(auto &str : opers){
        if(tokens.back() == str) return -1;
    }
    return 0;

}

int parseTokens(std::vector<std::string> &tokens, std::vector<cmd> &currentCMD){
    int cmdNum = 0;
    cmd newCmd;
    currentCMD.push_back(newCmd);
    for(auto it = tokens.begin(); it != tokens.end(); ++it) {
            // INPUT
            if(*it == "<") {
                // add the file path to our variable
                ++it;
                auto path = &(*it);
                currentCMD.at(cmdNum).readPath = const_cast<char*>((path->c_str()));
            }
            // OUTPUT
            else if(*it == ">") {
                ++it;
                auto path = &(*it);
                // add the file path to our variable
                currentCMD.at(cmdNum).writePath = const_cast<char*>((path->c_str()));
            }
            // handling PIPING
            else if(*it == "|") {
                currentCMD.at(cmdNum).cmdList.push_back( (char*) NULL);
                cmdNum++;
                cmd nextCmd;
                currentCMD.push_back(nextCmd);
                continue;
            }
            else {
                // add command or arg to cmdList
                auto arg = &(*it);
                currentCMD.at(cmdNum).cmdList.push_back(const_cast<char*>((arg->c_str())));
            }
    }
    // ADD nullptr to the last index of cmdList
    currentCMD.at(cmdNum).cmdList.push_back( (char*) NULL);
    return cmdNum + 1;
}

void execCommand(std::vector<std::string> tokens){
    // fork a child to run the command
    pid_t pid;
    int read_fd = -1, write_fd = -1, cmdNum = 0, status = 0;
    int pipe_fds[25][2]; // we can only handle 50 pipes at a time
    int pipeIn = -1, pipeOut = -1, prevPipeIn = -1;
    std::vector<cmd> currentCmds;
    //int std_in = STDIN_FILENO, std_out = STDOUT_FILENO; 

    /*
        PARSE HANDLER:
            Parse all the tokens and construct 2D vector where each
            vector is a cmd struct created when a pipe is found.
                Returns: # of pipe oper found.
    */
    cmdNum = parseTokens(tokens, currentCmds);
    
    /*
        PIPING HANDLER:
            Set up the pipe_fds according to the number of pipes found.
            Run each cmd in order.
    */
   for(int i = 0; i < cmdNum; i++) {
       // Handle pipes, if cmdNum > 1, then we have pipes
        if(cmdNum > 1) {
            if(i < cmdNum - 1) {
                if(pipe(pipe_fds[i]) < 0) {
                    std::cerr << "Pipe Failed: at cmd # " << i << "\n"; 
                    return;
                }
                pipeIn = pipe_fds[i][0];
                pipeOut = pipe_fds[i][1];
            }
        }

        // FORK the process, else if block is child, else block is parent.
        // both have access to their own vars declared before fork()
        pid = fork();
        // handle failed fork
        if (pid < 0) {
            std::cerr << "fork failed in execCommand";
            return;
        }

        else if(pid == 0) {
            /*  
                The child runs the command given from the cmdList vector
                if execv fails, will print to std::cerr the corresponding error message 
            */

            /* PIPING:
                    Link the pipes from current cmd to the next cmd
            */
           // if not the first cmd and more than one cmd, do this
           if(cmdNum > 1) {
                if(i > 0) {
                    if(dup2(prevPipeIn, STDIN_FILENO) < 0) std::cerr << "dup2 failed while setting STDIN to PIPEIN";
                }
                close(prevPipeIn);
                if( i < cmdNum - 1 ) {
                    if(dup2(pipeOut, STDOUT_FILENO) < 0) std::cerr << "dup2 failed while setting STDOUT to PIPEOUT";
                }
                close(pipeIn);
                close(pipeOut);
            }

            /* 
                REDIRECTION: 
                    if readPath is present, open file, change STDIN to that file,
                    and close the original file. Do same for writePath.
            */

            // READ REDIRECT
            if(currentCmds.at(i).readPath != (char*) NULL) {
                read_fd = open(currentCmds.at(i).readPath, O_RDONLY, 0666);
                if(read_fd != -1) {
                    dup2(read_fd, 0);
                    close(read_fd);
                }
                else {
                    std::cerr << "FILE" << read_fd << "DOES NOT EXIST\n";
                    exit(1);
                }
            }

            // WRITE REDIRECT
            if(currentCmds.at(i).writePath != (char*) NULL) {
                write_fd = open(currentCmds.at(i).writePath, O_WRONLY | O_CREAT | O_TRUNC, 0666);
                if(write_fd != -1) {
                    dup2(write_fd, 1);
                    close(write_fd);
                }
                else{
                    std::cerr << "DIRECTORY FOR " << write_fd << "DOES NOT EXIST\n";
                    exit(1);
                }
            }
            // EXECUTE HANDLER
            if(execv( ((const char*) (currentCmds.at(i).cmdList.front())), currentCmds.at(i).cmdList.data() ) < 0) {
                std::cerr << "EXECV FAILED: ";
                std::perror(currentCmds.at(i).cmdList.front());
                exit(errno);
            }
        } // END CHILD

        // have the parent wait for the child to complete
        else {
            currentCmds.at(i).pid = pid;
            // handle the closing of pipes for each cmd
            if(cmdNum > 1) {
                if(i > 0) {
                    close(prevPipeIn);
                }
                if( i < cmdNum - 1 ) {
                    prevPipeIn = pipeIn;
                }
                close(pipeOut);
            }
        }
        // END execCommand()
    }
    for(u_int k = 0; k < currentCmds.size(); k++) {
        waitpid(currentCmds.at(k).pid, &status, 0);
        for(u_int j = 0; j < currentCmds.at(k).cmdList.size() - 1; j++) {
                std::cout << currentCmds.at(k).cmdList.at(j) << " ";
            }
            std::cout << "exit status: " << status/256 << std::endl;
    }
}

void parse_and_run_command(const std::string &command) { 
    std::vector<std::string> tokens;
    std::istringstream s(command);
    std::string token;
    
    // tokenize using stringstream b/c its nice
    while (s >> token) {
        tokens.push_back(token);
    }

    // handle exit command or if the line has no input
    if (command == "exit")  exit(0);
    if (tokens.size() == 0) return;

    // Test if our tokens = valid command according to language
    // If they are, run the entered command
    if(validCommand(tokens) != 0) {
         std::cerr << "Invalid command";
         for(auto c : tokens) {
             std::cout << c << " "; 
         }
        std::cout << "\texit status: " << 255 << "\n";
    }
    else execCommand(tokens);

    //std::cerr << "Not implemented.\n";
}

int main(void) {
    std::string command;
    std::cout << "> ";
    while (std::getline(std::cin, command)) {
        
        parse_and_run_command(command);
        std::cout << "> ";
    }
    return 0;
}