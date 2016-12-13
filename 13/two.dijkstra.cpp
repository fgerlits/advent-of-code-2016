#include "../dijkstra.hpp"

int main()
{
    auto graph = process_input();
    row_type distances = dijkstra(graph);

    std::cout << std::count_if(distances.begin(), distances.end(), [](value_type const& value){ return value <= 50; }) << std::endl;

    return 0;
}
