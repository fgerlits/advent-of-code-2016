#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def test_rotate_right
        assert_equal([1, 0], rotate([0, 1], 'R'))
        assert_equal([0, -1], rotate([1, 0], 'R'))
        assert_equal([-1, 0], rotate([0, -1], 'R'))
        assert_equal([0, 1], rotate([-1, 0], 'R'))
    end

    def test_rotate_left
        assert_equal([-1, 0], rotate([0, 1], 'L'))
        assert_equal([0, -1], rotate([-1, 0], 'L'))
        assert_equal([1, 0], rotate([0, -1], 'L'))
        assert_equal([0, 1], rotate([1, 0], 'L'))
    end

    def test_take_steps
        assert_equal([5, 0], take_steps([0, 0], [1, 0], 5))
        assert_equal([0, -7], take_steps([0, 0], [0, -1], 7))
        assert_equal([4, 3], take_steps([-2, -3], [2, 2], 3))
        assert_equal([100, 0], take_steps([0, 0], [1, 0], 100))
    end

    def test_move
        state = State.new([0, 0], [0, 1])
        assert_equal([1, 0], state.move('R5').heading)
        assert_equal([5, 0], state.move('R5').position)
        assert_equal([-1, 0], state.move('L5').heading)
        assert_equal([-5, 0], state.move('L5').position)
        assert_equal([100, 0], state.move('R100').position)
    end

    def test_distance
        assert_equal(5, distance([0, 0], [5, 0]))
        assert_equal(7, distance([0, 0], [3, 4]))
        assert_equal(7, distance([0, 0], [-3, 4]))
        assert_equal(7, distance([0, 0], [3, -4]))
        assert_equal(7, distance([0, 0], [-3, -4]))
    end

    def test_solve
        assert_equal(5, solve('R2, L3'))
        assert_equal(2, solve('R2, R2, R2'))
        assert_equal(12, solve('R5, L5, R5, R3'))
        assert_equal(200, solve('L100, R100'))
    end
end
