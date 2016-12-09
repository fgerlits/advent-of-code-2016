#!/usr/bin/env ruby

require_relative 'two'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def test_find_decoded_length
        assert_equal 9,
            find_decoded_length('(3x3)XYZ')
        assert_equal 20,
            find_decoded_length('X(8x2)(3x3)ABCY')
        assert_equal 241920,
            find_decoded_length('(27x12)(20x12)(13x14)(7x10)(1x12)A')
        assert_equal 445,
            find_decoded_length('(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN')
    end

end
