#!/usr/bin/env ruby

class Graph
    attr_reader :edges, :special_locations, :size

    def initialize(lines)
        locations = number_locations(lines)
        @size += 1
        find_edges(locations)
    end

    def find_edges(locations)
        @edges = []
        locations.each_with_index do |row, y|
            (0...row.size).each do |x|
                @edges += find_edges_from(locations, y, x)
            end
        end
    end

    NEIGHBORS = [[0, -1], [-1, 0], [0, 1], [1, 0]]

    def find_edges_from(locations, y, x)
        if ! locations[y][x].nil?
            from = locations[y][x]
            NEIGHBORS.map{|dy, dx| locations[y + dy][x + dx]} \
                     .compact \
                     .map{|to| [from, to]}
        else
            []
        end
    end

    def number_locations(lines)
        @special_locations = []
        @size = -1
        lines.map do |line|
            line.each_char.map do |location|
                if location =~ /\d/
                    @size += 1
                    @special_locations[location.to_i] = @size
                elsif location == '.'
                    @size += 1
                end
            end
        end
    end

    def to_s
        [@special_locations.join(' '),
         @size,
         @edges.map{|from, to| "#{from} #{to} 1"}].join("\n")
    end
end
                   
if __FILE__ == $0
    puts Graph.new(ARGF.readlines)
end
