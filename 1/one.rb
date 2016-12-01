#!/usr/bin/env ruby

class Coord
    attr_reader :x, :y

    def initialize(x, y)
        @x, @y = x, y
    end

    def ==(other)
        @x == other.x && @y == other.y
    end
end

def rotate(heading, direction)
    case direction
    when 'L'
        Coord.new(-heading.y, heading.x)
    when 'R'
        Coord.new(heading.y, -heading.x)
    end
end

def take_steps(position, heading, count)
    Coord.new(position.x + count * heading.x,
              position.y + count * heading.y)
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
    (from.x - to.x).abs + (from.y - to.y).abs
end

def solve(steps)
    initial = State.new(Coord.new(0, 0), Coord.new(0, 1))
    final = steps.split(', ').reduce(initial) do |state, step|
        state.move(step)
    end
    distance(initial.position, final.position)
end

if __FILE__ == $0
    puts solve(ARGF.read)
end
