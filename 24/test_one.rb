#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

SAMPLE_INPUT = <<~EOF.split("\n")
    ###########
    #0.1.....2#
    #.#######.#
    #4.......3#
    ###########
EOF

class TestGraph < Test::Unit::TestCase

    def setup
        @graph = Graph.new(SAMPLE_INPUT)
    end

    def test_number_locations
        assert_equal [[nil] * 11,
            [nil, 0, 1, 2, 3, 4, 5, 6, 7, 8, nil],
            [nil, 9, *[nil]*7, 10, nil],
            [nil, 11, 12, 13, 14, 15, 16, 17, 18, 19, nil],
            [nil] * 11], @graph.number_locations(SAMPLE_INPUT)
        assert_equal [0, 2, 8, 19, 11], @graph.special_locations
    end

    def test_initialize
        assert_equal 20, @graph.size
        assert_equal [[0, 1], [0, 9], [1, 0], [1, 2], [2, 1]],
                     @graph.edges.take(5)
        assert_equal [[8, 7], [8, 10]],
                     @graph.edges.select{|from, to| from == 8}
    end

    def test_to_s
        assert_equal "0 2 8 19 11\n20\n0 1 1\n0 9 1\n",
                     @graph.to_s[0, 27]
    end

end
