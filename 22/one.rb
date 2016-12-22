#!/usr/bin/env ruby

require_relative '../enumerable-util'

class Node
    attr_reader :used, :avail

    def initialize(x, y, used, avail)
        @x, @y, @used, @avail = x, y, used, avail
    end
end

def process_input(lines)
    lines.map do |line|
        if line =~ /node-x(\d+)-y(\d+) *\d+T *(\d+)T *(\d+)T/
            Node.new($1.to_i, $2.to_i, $3.to_i, $4.to_i)
        end
    end.compact
end

class Grid
    def initialize(lines)
        @nodes = process_input(lines).sort_by{|node| node.avail}
        @size = @nodes.size
    end

    def number_of_nodes_which_can_take(data)
        index = @nodes.bsearch_index{|node| node.avail >= data} || @size
        @size - index
    end

    def solve
        @nodes.map do |node|
           if node.used == 0
               0
           else
               number_of_nodes_which_can_take(node.used)
           end
        end.sum
    end
end

if __FILE__ == $0
    puts Grid.new(ARGF.readlines).solve
end
