#include "one.hpp"

int main(int argc, char * argv[])
{
    if (argc < 2) {
        std::cout << "Usage: " << argv[0] << " <seed>" << std::endl;
        std::exit(1);
    }

    std::string seed = argv[1];

    try {
        std::cout << shortest_path(seed) << std::endl;
        return 0;
    } catch (std::runtime_error const& ex) {
        std::cout << ex.what() << std::endl;
        return 1;
    }
}
