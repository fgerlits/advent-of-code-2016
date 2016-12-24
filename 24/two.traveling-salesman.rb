#!/usr/bin/env ruby

require_relative 'one.traveling-salesman'

def find_shortest_route(matrix)
    (1...matrix.size).to_a.permutation \
        .map{|route| cost(route + [0], matrix)} \
        .min
end

if __FILE__ == $0
    puts find_shortest_route(process_input(ARGF.readlines))
end
