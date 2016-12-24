#!/usr/bin/env ruby

require_relative '../enumerable-util'

def cost(route, matrix)
    ([0] + route).each_cons(2).map{|from, to| matrix[from][to]}.sum
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
