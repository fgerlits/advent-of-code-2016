#pragma once
#include "one.hpp"

std::size_t longest_path(std::string const& seed)
{
    std::deque<Position> backlog{{Path{}, Coord{0, 0}}};
    Path latest_result;

    while (! backlog.empty()) {
        auto current = backlog.front();
        backlog.pop_front();

        if (is_vault(current)) {
            latest_result = current.path;
            continue;
        }

        auto moves = valid_moves_from(current, seed);
        backlog.insert(backlog.end(), moves.begin(), moves.end());
    }

    return latest_result.size();
}
