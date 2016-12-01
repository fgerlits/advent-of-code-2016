#!/usr/bin/env ruby

require_relative 'two'
require 'test/unit'

class TestTwo < Test::Unit::TestCase

    def test_add
        assert_equal(Coord.new(5, 3),
                     Coord.new(4, 3) + Coord.new(1, 0))
    end

    def test_in_between
        assert_equal([Coord.new(0, 1), Coord.new(0, 2), Coord.new(0, 3)],
                     in_between(Coord.new(0, 0), Coord.new(0, 3), Coord.new(0, 1)))
    end

    def test_include
        assert(Set.new([Coord.new(0, 0), Coord.new(0, 1)]).include?(Coord.new(0, 1)))
        assert(! Set.new([Coord.new(0, 0), Coord.new(0, 1)]).include?(Coord.new(1, 0)))
    end

    def test_solve
        assert_equal(4, solve('R8, R4, R4, R8'))
    end

end
