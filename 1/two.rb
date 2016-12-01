#!/usr/bin/env ruby

require_relative 'one'
require 'set'

def in_between(from, to, heading)
    result = []
    position = from
    while position != to
        position = position + heading
        result << position
    end
    result
end

def solve(steps)
    initial = State.new(Coord.new(0, 0), Coord.new(0, 1))
    visited = Set.new
    visited << initial.position
    steps.split(', ').reduce(initial) do |state, step|
        new_state = state.move(step)
        in_between(state.position, new_state.position, new_state.heading).each do |position|
            if visited.include?(position)
                return distance(initial.position, position)
            else
                visited << position
            end
        end
        new_state
    end
    raise 'No position was visited twice'
end

if __FILE__ == $0
    puts solve(ARGF.read)
end
