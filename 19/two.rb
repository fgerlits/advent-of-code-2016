#!/usr/bin/env ruby

class Elves
    def initialize(n)
        @circle = (1..n).to_a
        @current_index = 0
        @n = n
        @size = n
    end

    def steal
        victim = steal_position
        @circle[victim] = nil
        @size -= 1
    end

    def next_live_index(position)
        loop do
            position += 1
            if position == @n
                position = 0
            end
            if ! @circle[position].nil?
                return position
            end
        end
    end

    def steal_position
        (@size / 2).times.reduce(@current_index) do |position, _|
            next_live_index(position)
        end
    end

    def next_elf
        @current_index = next_live_index(@current_index)
    end

    def finished?
        @size == 1
    end

    def solve
        while ! finished? do
            steal
            next_elf
        end
        @circle[@current_index]
    end
end

def solve(n)
    elves = Elves.new(n)
    elves.solve
end

# The answer seems to be
# f(x) = x          if x == 3^k
# f(x) = x - 3^k    if 3^k < x < 2*3^k (ie. base-3 starts with 1)
# f(x) = 2*(x - 2*3^k) + 3^k    if 2*3^k <= x < 3^{k+1} (ie. base-3 starts with 2)
# TODO: prove this
def solve_analytically(n)
    base_three = n.to_s(3)
    first_digit = base_three.slice!(0)
    remainder = base_three.to_i(3)
    case first_digit
        when '1'
            if remainder == 0
                n
            else
                remainder
            end
        when '2'
            three_to_the_k = (n - remainder) / 2
            2 * remainder + three_to_the_k
    end
end

if __FILE__ == $0
    puts solve(ARGV[0].to_i)
end
