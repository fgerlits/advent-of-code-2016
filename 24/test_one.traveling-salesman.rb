#!/usr/bin/env ruby

require_relative 'one.traveling-salesman'
require 'test/unit'

SAMPLE_INPUT = <<~EOF.split("\n")
    0 2 8 10 2 
    2 0 6 8 4 
    8 6 0 2 10 
    10 8 2 0 8 
    2 4 10 8 0 
EOF

class TestOne < Test::Unit::TestCase

    def test_process_input
        assert_equal [[0, 2, 8, 10, 2],
                      [2, 0, 6, 8, 4],
                      [8, 6, 0, 2, 10],
                      [10, 8, 2, 0, 8],
                      [2, 4, 10, 8, 0]], process_input(SAMPLE_INPUT)
    end

    def test_find_shortest_route
        assert_equal 14, find_shortest_route(process_input(SAMPLE_INPUT))
    end

end
