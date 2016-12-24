#!/usr/bin/env ruby

def cost(route, matrix)
    current = 0
    cost = 0
    route.each do |location|
        cost += matrix[current][location]
        current = location
    end
    cost
end

def find_shortest_route(matrix)
    (1...matrix.size).to_a.permutation \
                     .map{|route| cost(route, matrix)} \
                     .min
end

def process_input(lines)
    lines.map{|line| line.split.map{|num| num.to_i}}
end

if __FILE__ == $0
    puts find_shortest_route(process_input(ARGF.readlines))
end
