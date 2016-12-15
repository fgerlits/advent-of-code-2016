#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

SAMPLE_INPUT = <<~EOF.split("\n")
    Disc #1 has 5 positions; at time=0, it is at position 4.
    Disc #2 has 2 positions; at time=0, it is at position 1.
EOF

class TestOne < Test::Unit::TestCase

    def setup
        @wheels = process_input(SAMPLE_INPUT)
    end

    def test_process_input
        assert_equal [[5, 4], [2, 1]], @wheels
    end

    def test_falls_through
        assert falls_through(@wheels[0], 1, 0)
        assert ! falls_through(@wheels[1], 2, 0)

        assert falls_through(@wheels[0], 1, 5)
        assert falls_through(@wheels[1], 2, 5)
    end

    def test_falls_through_all
        assert ! falls_through_all(@wheels, 0)
        assert falls_through_all(@wheels, 5)
    end

    def test_integers_from
        assert_equal [0, 1, 2, 3, 4], integers_from(0).take(5)
        assert_equal [10, 11, 12, 13, 14], integers_from(10).take(5)
    end

    def test_solve
        assert_equal 5, solve(@wheels)
    end

end
