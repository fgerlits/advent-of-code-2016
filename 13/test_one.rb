#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase
    def test_num_ones_in_binary_rep
        assert_equal 0, num_ones_in_binary_rep(0)
        assert_equal 1, num_ones_in_binary_rep(1)
        assert_equal 1, num_ones_in_binary_rep(8)
        assert_equal 2, num_ones_in_binary_rep(9)
        assert_equal 2, num_ones_in_binary_rep(10)
        assert_equal 3, num_ones_in_binary_rep(11)
        assert_equal 2, num_ones_in_binary_rep(12)
        assert_equal 3, num_ones_in_binary_rep(13)
        assert_equal 3, num_ones_in_binary_rep(14)
        assert_equal 4, num_ones_in_binary_rep(15)
    end
end

class TestGraph < Test::Unit::TestCase
    def setup
        @graph = Graph.new(4, 0, 3)
    end

    def test_to_s
        assert_equal "4 0 3", @graph.to_s
        @graph.add_edge!(0, 1, 10)
        assert_equal "4 0 3\n0 1 10", @graph.to_s
        @graph.add_edge!(2, 3, 15)
        assert_equal "4 0 3\n0 1 10\n2 3 15", @graph.to_s
    end
end

class TestMaze < Test::Unit::TestCase
    def setup
        @maze = Maze.new(10, 10, 7)
    end

    def test_to_s
        assert_equal <<~EOF.chomp, @maze.to_s
            .#.####.##
            ..#..#...#
            #....##...
            ###.#.###.
            .##..#..#.
            ..##....#.
            #...##.###
            EOF
    end

    def test_number_cells
        assert_equal <<~EOF.chomp, @maze.number_cells!.to_s
            0#1####2##
            34#56#789#
            #10111213##141516
            ###17#18###19
            20##2122#2324#25
            2627##28293031#32
            #333435##36###
            EOF
    end

    def test_cell_at
        @maze.number_cells!
        assert_equal 4, @maze.cell_at(1, 1)
        assert_equal '#', @maze.cell_at(9, 6)
    end

    def test_moves_from
        @maze.number_cells!
        assert_equal [], @maze.moves_from(2, 0)
        assert_equal [[3, 0], [3, 4]], @maze.moves_from(0, 1)
        assert_equal [[8, 2], [8, 9], [8, 14], [8, 7]], @maze.moves_from(7, 1)
    end

    def test_to_graph
        graph = @maze.number_cells!.to_graph([1, 1], [7, 4])
        assert_equal <<~EOF.chomp,
            37 4 24
            0 3 1
            2 8 1
            3 0 1
            3 4 1
            EOF
            graph.to_a[0..4].map{|row| row.join(' ')}.join("\n")
    end
end
