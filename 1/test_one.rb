#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def test_rotate_right
        assert_equal(Coord.new(1, 0), rotate(Coord.new(0, 1), 'R'))
        assert_equal(Coord.new(0, -1), rotate(Coord.new(1, 0), 'R'))
        assert_equal(Coord.new(-1, 0), rotate(Coord.new(0, -1), 'R'))
        assert_equal(Coord.new(0, 1), rotate(Coord.new(-1, 0), 'R'))
    end

    def test_rotate_left
        assert_equal(Coord.new(-1, 0), rotate(Coord.new(0, 1), 'L'))
        assert_equal(Coord.new(0, -1), rotate(Coord.new(-1, 0), 'L'))
        assert_equal(Coord.new(1, 0), rotate(Coord.new(0, -1), 'L'))
        assert_equal(Coord.new(0, 1), rotate(Coord.new(1, 0), 'L'))
    end

    def test_take_steps
        assert_equal(Coord.new(5, 0), take_steps(Coord.new(0, 0), Coord.new(1, 0), 5))
        assert_equal(Coord.new(0, -7), take_steps(Coord.new(0, 0), Coord.new(0, -1), 7))
        assert_equal(Coord.new(4, 3), take_steps(Coord.new(-2, -3), Coord.new(2, 2), 3))
        assert_equal(Coord.new(100, 0), take_steps(Coord.new(0, 0), Coord.new(1, 0), 100))
    end

    def test_move
        state = State.new(Coord.new(0, 0), Coord.new(0, 1))
        assert_equal(Coord.new(1, 0), state.move('R5').heading)
        assert_equal(Coord.new(5, 0), state.move('R5').position)
        assert_equal(Coord.new(-1, 0), state.move('L5').heading)
        assert_equal(Coord.new(-5, 0), state.move('L5').position)
        assert_equal(Coord.new(100, 0), state.move('R100').position)
    end

    def test_distance
        assert_equal(5, distance(Coord.new(0, 0), Coord.new(5, 0)))
        assert_equal(7, distance(Coord.new(0, 0), Coord.new(3, 4)))
        assert_equal(7, distance(Coord.new(0, 0), Coord.new(-3, 4)))
        assert_equal(7, distance(Coord.new(0, 0), Coord.new(3, -4)))
        assert_equal(7, distance(Coord.new(0, 0), Coord.new(-3, -4)))
    end

    def test_solve
        assert_equal(5, solve('R2, L3'))
        assert_equal(2, solve('R2, R2, R2'))
        assert_equal(12, solve('R5, L5, R5, R3'))
        assert_equal(200, solve('L100, R100'))
    end
end
