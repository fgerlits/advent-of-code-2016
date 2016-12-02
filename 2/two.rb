#!/usr/bin/env ruby

class Keypad
    TABLE = ['.......',
             '...1...',
             '..234..',
             '.56789.',
             '..ABC..',
             '...D...',
             '.......']

    def initialize
        @x, @y = 3, 1
    end

    def direction_to_move(direction)
        case direction
        when 'U'
            [-1, 0]
        when 'D'
            [1, 0]
        when 'L'
            [0, -1]
        when 'R'
            [0, 1]
        end
    end

    def move_one!(direction)
        dx, dy = direction_to_move(direction)
        if TABLE[@x + dx][@y + dy] != '.'
            @x += dx
            @y += dy
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
        TABLE[@x][@y]
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
