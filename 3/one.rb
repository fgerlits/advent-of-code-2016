#!/usr/bin/env ruby

def is_triangle(triple)
    x, y, z = triple.sort
    x + y > z
end

def count_triangles(list_of_triples)
    list_of_triples.count{|triple| is_triangle(triple)}
end

if __FILE__ == $0
    input = ARGF.readlines.map{|line| line.split.map{|s| s.to_i}}
    puts count_triangles(input)
end
