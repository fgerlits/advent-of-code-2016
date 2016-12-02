#!/usr/bin/env ruby

class Keypad
    attr_reader :value

    def initialize(value)
        @value = value
    end

    def move_one!(direction)
        case direction
        when 'U'
            if @value > 3
                @value -= 3
            end
        when 'D'
            if @value < 7
                @value += 3
            end
        when 'L'
            if @value % 3 != 1
                @value -= 1
            end
        when 'R'
            if @value % 3 != 0
                @value += 1
            end
        end
        self
    end

    def move!(steps)
        steps.each_char do |direction|
            move_one!(direction)
        end
        self
    end
end

def solve(list_of_steps)
    keypad = Keypad.new(5)
    list_of_steps.map do |steps|
        keypad.move!(steps).value
    end.join
end

if __FILE__ == $0
    puts solve(ARGF.read.split)
end
