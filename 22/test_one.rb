#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

SAMPLE_INPUT = <<~EOF.split("\n")
    Filesystem              Size  Used  Avail  Use%
    /dev/grid/node-x0-y0     89T   10T    24T   73%
    /dev/grid/node-x0-y1     92T   20T    27T   70%
    /dev/grid/node-x0-y2     86T   30T    18T   79%
    EOF

class TestOne < Test::Unit::TestCase

    def test_process_input
        assert_equal [24, 27, 18],
                     process_input(SAMPLE_INPUT).map{|node| node.avail}
    end

    def test_number_of_nodes_which_can_take
        grid = Grid.new(SAMPLE_INPUT)
        assert_equal 3, grid.number_of_nodes_which_can_take(10)
        assert_equal 2, grid.number_of_nodes_which_can_take(20)
        assert_equal 1, grid.number_of_nodes_which_can_take(27)
        assert_equal 0, grid.number_of_nodes_which_can_take(28)
    end

    def test_solve
        grid = Grid.new(SAMPLE_INPUT)
        assert_equal 5, grid.solve
    end

end
