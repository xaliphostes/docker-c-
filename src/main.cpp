#include <iostream>
#include <fstream>
#include <ctime>

int main(int argc, char* argv[]) {    
    std::string output_filename = "results.txt";
    
    std::ofstream outfile(output_filename);
    
    if (!outfile) {
        std::cerr << "Error : Cannot create the file " << output_filename << std::endl;
        return 1;
    }
    
    outfile << "This file was created by the program running in a container" << std::endl;
    outfile << "Arguments:" << std::endl;
    for (int i = 1; i < argc; ++i) {
        outfile << argv[i] << std::endl;
    }
    
    outfile.close();
    
    std::cout << "File created : " << output_filename << std::endl;
    return 0;
}
