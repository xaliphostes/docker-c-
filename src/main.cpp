#include <iostream>

int main(int argc, char* argv[]) {
    std::cout << "Programme exécuté dans Docker" << std::endl;
    
    if (argc > 1) {
        std::cout << "Arguments reçus :" << std::endl;
        for (int i = 1; i < argc; ++i) {
            std::cout << argv[i] << std::endl;
        }
    }
    
    return 0;
}
