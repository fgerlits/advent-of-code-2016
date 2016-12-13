#!/usr/bin/env ruby

def num_ones_in_binary_rep(n)
    result = 0
    while n != 0
        n &= n - 1
        result += 1
    end
    result
end

def is_wall?(seed, x, y)
    num_ones_in_binary_rep(seed + x*x + 3*x + 2*x*y + y + y*y).odd?
end

class Graph
    def initialize(num_vertices, start, finish)
        @num_vertices = num_vertices
        @start = start
        @finish = finish
        @edges = []
    end

    def add_edge!(from, to, distance)
        @edges << [from, to, distance]
    end

    def to_a
        [[@num_vertices, @start, @finish]] + @edges
    end
        
    def to_s
        to_a.map{|row| row.join(' ')}.join("\n")
    end
end

class Maze
    def initialize(seed, xsize, ysize)
        @xsize = xsize
        @ysize = ysize
        @maze = (0...ysize).map do |y|
                   (0...xsize).map do |x|
                       is_wall?(seed, x, y) ? '#' : '.'
                   end
               end
    end

    def to_s
        @maze.map{|row| row.join}.join("\n")
    end

    def number_cells!
        cell_number = -1
        @maze = @maze.map do |row|
                   row.map do |cell|
                       case cell
                           when '#'
                               '#'
                           when '.'
                               cell_number += 1
                       end
                   end
               end
        @num_open_cells = cell_number + 1
        self
    end

    def cell_at(x, y)
        if x >= 0 && x < @xsize && y >= 0 && y < @ysize
            @maze[y][x]
        end
    end

    def moves_from(x, y)
        from = cell_at(x, y)
        case from
            when '#'
                []
            else
                [[0, -1], [1, 0], [0, 1], [-1, 0]].map do |dx, dy|
                    to = cell_at(x + dx, y + dy)
                    if !to.nil? && to != '#'
                        [from, to]
                    end
                end.compact
        end
    end

    def to_graph(start, finish)
        graph = Graph.new(@num_open_cells, cell_at(*start), cell_at(*finish))
        @maze.each_with_index do |row, y|
            row.each_with_index do |cell, x|
                moves_from(x, y).each do |move|
                    graph.add_edge!(move[0], move[1], 1)
                end
            end
        end
        graph
    end
end

if __FILE__ == $0
    args = ARGV.map{|arg| arg.to_i}
    seed = args[0]
    size = args[1]
    start = args[2..3]
    finish = args[4..5]
    maze = Maze.new(seed, size, size).number_cells!
    puts maze.to_graph(start, finish)
end
