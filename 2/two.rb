#!/usr/bin/env ruby

require_relative '../coord'

class Keypad
    TABLE = ['.......',
             '...1...',
             '..234..',
             '.56789.',
             '..ABC..',
             '...D...',
             '.......']

    def initialize
        @position = Coord.new(3, 1)
    end

    def direction_to_move(direction)
        case direction
        when 'U'
            Coord.new(-1, 0)
        when 'D'
            Coord.new(1, 0)
        when 'L'
            Coord.new(0, -1)
        when 'R'
            Coord.new(0, 1)
        end
    end

    def value_at(position)
        TABLE[position.x][position.y]
    end

    def move_one!(direction)
        new_position = @position + direction_to_move(direction)
        if value_at(new_position) != '.'
            @position = new_position
        end
        self
    end

    def move!(steps)
        steps.each_char do |direction|
            move_one!(direction)
        end
        self
    end

    def value
        value_at(@position)
    end
end

def solve(list_of_steps)
    keypad = Keypad.new
    list_of_steps.map do |steps|
        keypad.move!(steps).value
    end.join
end

if __FILE__ == $0
    puts solve(ARGF.read.split)
end
