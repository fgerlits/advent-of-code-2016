#!/usr/bin/env ruby

require_relative '../enumerable-util'

def process_input(lines)
    lines.map{|line| line.chomp.each_char.to_a} \
         .transpose
end

def most_frequent(elems)
    elems.frequencies.max_by{|elem, freq| freq}[0]
end

def solve(columns)
    columns.map{|column| most_frequent(column)}.join
end

if __FILE__ == $0
    input = process_input(ARGF.readlines)
    puts solve(input)
end
