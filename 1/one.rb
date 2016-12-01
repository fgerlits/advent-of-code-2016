#!/usr/bin/env ruby

def rotate(heading, direction)
    x, y = heading
    case direction
    when 'L'
        [-y, x]
    when 'R'
        [y, -x]
    end
end

def take_steps(position, heading, count)
    x, y = position
    dx, dy = heading
    [x + count * dx, y + count * dy]
end

class State
    attr_reader :position, :heading

    def initialize(position, heading)
        @position = position
        @heading = heading
    end

    def move(step)
        heading = rotate(@heading, step[0])
        position = take_steps(@position, heading, step[1..-1].to_i)
        State.new(position, heading)
    end
end

def distance(from, to)
    x1, y1 = from
    x2, y2 = to
    (x1 - x2).abs + (y1 - y2).abs
end

def solve(steps)
    initial = State.new([0, 0], [0, 1])
    final = steps.split(', ').reduce(initial) do |state, step|
        state.move(step)
    end
    distance(initial.position, final.position)
end

if __FILE__ == $0
    puts solve(ARGF.read)
end
