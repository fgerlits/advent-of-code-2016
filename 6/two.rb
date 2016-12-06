#!/usr/bin/env ruby

require_relative 'one'

def least_frequent(elems)
    elems.frequencies.min_by{|elem, freq| freq}[0]
end

def solve(columns)
    columns.map{|column| least_frequent(column)}.join
end

if __FILE__ == $0
    input = process_input(ARGF.readlines)
    puts solve(input)
end
