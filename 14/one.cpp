// compile with: g++ --std=c++11 -O3 ./one.cpp -lcrypto

#include "../5/one.h"

int main(int argc, char * argv[])
{
    if (argc < 3) {
        std::cout << "Usage: " << argv[0] << " <seed> <number>" << std::endl;
        std::exit(1);
    }

    std::string seed = argv[1];
    std::size_t n = std::stoi(argv[2]);

    for (int i = 0; i < n; ++i) {
        std::cout << format(createMd5(seed + std::to_string(i))) << "\n";
    }

    return 0;
}
