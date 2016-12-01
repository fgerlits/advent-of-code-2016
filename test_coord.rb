#!/usr/bin/env ruby

require_relative 'coord'
require 'test/unit'
require 'set'

class TestCoord < Test::Unit::TestCase

    def test_add
        assert_equal(Coord.new(5, 3),
                     Coord.new(4, 3) + Coord.new(1, 0))
    end

    def test_include
        assert(Set.new([Coord.new(0, 0), Coord.new(0, 1)]).include?(Coord.new(0, 1)))
        assert(! Set.new([Coord.new(0, 0), Coord.new(0, 1)]).include?(Coord.new(1, 0)))
    end

end

