#include "../dijkstra.hpp"

int main()
{
    auto graph = process_input();
    row_type distances = dijkstra(graph);

    std::cout << distances[graph.finish] << std::endl;

    return 0;
}
