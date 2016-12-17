#pragma once
#include <algorithm>
#include <deque>
#include <iterator>
#include <stdexcept>
#include <vector>
#include "../md5sum.hpp"

using Path = std::vector<char>;

std::ostream & operator<<(std::ostream & os, Path const& path)
{
    std::copy(path.begin(), path.end(), std::ostream_iterator<char>{os});
    return os;
}

struct Coord
{
    int x;
    int y;

    void operator+=(Coord const& other)
    {
        x += other.x;
        y += other.y;
    }

    bool is_valid() const
    {
        return x >= 0 && x < 4 && y >= 0 && y < 4;
    }
};

bool operator==(Coord const& left, Coord const& right)
{
    return left.x == right.x && left.y == right.y;
}

Coord coord_change(char direction)
{
    switch (direction) {
        case 'U' : return Coord{0, -1};
        case 'D' : return Coord{0, 1};
        case 'L' : return Coord{-1, 0};
        case 'R' : return Coord{1, 0};
        default : throw std::logic_error("this can't happen");
    }
}

std::string compute_hash(Path const& path, std::string const& seed)
{
    std::ostringstream oss;
    oss << seed << path;
    return format(createMd5(oss.str()));
}

std::size_t direction_to_index(char direction)
{
    switch (direction) {
        case 'U' : return 0;
        case 'D' : return 1;
        case 'L' : return 2;
        case 'R' : return 3;
        default : throw std::logic_error("this can't happen");
    }
}

bool is_open(char hash_char)
{
    return hash_char >= 'b' && hash_char <= 'f';
}

bool door_is_open(std::string const& hash, char direction)
{
    return is_open(hash[direction_to_index(direction)]);
}

struct Position
{
    Path path;
    Coord coord;
};

bool operator==(Position const& left, Position const& right)
{
    return left.path == right.path && left.coord == right.coord;
}

using Positions = std::vector<Position>;

Positions valid_moves_from(Position const& position, std::string const& seed)
{
    Positions moves;
    auto hash = compute_hash(position.path, seed);
    for (char direction : {'U', 'D', 'L', 'R'}) {
        Position next = position;
        next.coord += coord_change(direction);
        if (next.coord.is_valid() && door_is_open(hash, direction)) {
            next.path.push_back(direction);
            moves.push_back(next);
        }
    }
    return moves;
}

bool is_vault(Position const& position)
{
    return position.coord.x == 3 && position.coord.y == 3;
}

Path shortest_path(std::string const& seed)
{
    std::deque<Position> backlog{{Path{}, Coord{0, 0}}};

    while (! backlog.empty()) {
        auto current = backlog.front();
        backlog.pop_front();

        if (is_vault(current)) {
            return current.path;
        }

        auto moves = valid_moves_from(current, seed);
        backlog.insert(backlog.end(), moves.begin(), moves.end());
    }

    throw std::runtime_error("no solution found");
}
