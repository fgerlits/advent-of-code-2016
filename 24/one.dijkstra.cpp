#include "../dijkstra.hpp"
#include <sstream>

namespace
{
    std::vector<vertex_type> read_special_locations()
    {
        std::string first_line;
        std::getline(std::cin, first_line);
        std::istringstream iss{first_line};
        std::istream_iterator<vertex_type> begin{iss}, end;
        return {begin, end};
    }

    void print_distances_to_locations(row_type const& distances, std::vector<vertex_type> const& locations)
    {
        for (auto location : locations) {
            std::cout << distances[location] << " ";
        }
        std::cout << "\n";
    }
}

int main()
{
    auto special_locations = read_special_locations();
    auto graph = process_input();

    for (auto special_location : special_locations) {
        graph.start = special_location;
        row_type distances = dijkstra(graph);
        print_distances_to_locations(distances, special_locations);
    }

    return 0;
}
