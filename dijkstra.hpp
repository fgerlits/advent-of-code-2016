#pragma once
#include <boost/heap/fibonacci_heap.hpp>
#include <vector>
#include <limits>
#include <map>
#include <iostream>
#include <algorithm>
#include <iterator>

using vertex_type = std::size_t;
using value_type = int;

using row_type = std::vector<value_type>;
using matrix_type = std::vector<row_type>;

constexpr value_type PLUS_INFTY = std::numeric_limits<value_type>::max();

struct Edge
{
    vertex_type tail, head;
    value_type value;
};

std::istream& operator>>(std::istream& in, Edge& edge)
{
    return in >> edge.tail >> edge.head >> edge.value;
}

std::ostream& operator<<(std::ostream& out, Edge const& edge)
{
    return out << "(" << edge.tail << ", " << edge.head << ") " << edge.value;
}

struct Graph
{
    size_t size;
    vertex_type start;
    std::vector<Edge> edges;
};

Graph process_input()
{
    size_t n;
    std::cin >> n;

    std::istream_iterator<Edge> begin{std::cin}, end;

    return Graph{n, 0, {begin, end}};
}

struct Node
{
    vertex_type vertex;
    value_type value;
};

struct node_greater
{
    bool operator()(Node const& left, Node const& right) const {
        return left.value > right.value;
    }
};

using heap_type = boost::heap::fibonacci_heap<Node, boost::heap::compare<node_greater>>;
using handle_type = heap_type::handle_type;

// runs dijkstra's algorithm on the given graph
// vertices are numbers between 0 and n-1, inclusive
// computes the min-value path from the start vertex to all other vertices
// if a vertex is not reachable from start, its value is PLUS_INFTY
row_type dijkstra(Graph const& graph)
{
    auto const n = graph.size;
    std::vector<std::vector<Edge>> outgoingEdges(n);
    for (auto const& edge : graph.edges) {
        outgoingEdges[edge.tail].push_back(edge);
    }

    heap_type heap;
    std::vector<handle_type> handles(n);
    for (vertex_type v = 0; v < n; ++v) {
        handles[v] = heap.push(Node{v, PLUS_INFTY});
    }
    heap.update(handles[graph.start], Node{graph.start, 0});

    row_type result(n, PLUS_INFTY);
    while (not heap.empty()) {
        auto current = heap.top();
        heap.pop();
        if (current.value == PLUS_INFTY) {
            break;
        }
        result[current.vertex] = current.value;
        for (auto const& edge : outgoingEdges[current.vertex]) {
            auto newValue = current.value + edge.value;
            auto handle = handles[edge.head];
            const auto& neighbor = *handle;
            if (newValue < neighbor.value) {
                heap.update(handle, Node{neighbor.vertex, newValue});
            }
        }
    }
    return result;
}
