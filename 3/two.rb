#!/usr/bin/env ruby

require_relative 'one'

def transpose_input(rows)
    rows.transpose.map{|column| column.each_slice(3).to_a}.flatten(1)
end

if __FILE__ == $0
    input = ARGF.readlines.map{|line| line.split.map{|s| s.to_i}}
    puts count_triangles(transpose_input(input))
end
