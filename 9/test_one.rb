#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def test_find_decoded_length
        assert_equal 7, find_decoded_length('A(1x5)BC')
        assert_equal 9, find_decoded_length('(3x3)XYZ')
        assert_equal 11, find_decoded_length('A(2x2)BCD(2x2)EFG')
        assert_equal 6, find_decoded_length('(6x1)(1x3)A')
        assert_equal 18, find_decoded_length('X(8x2)(3x3)ABCY')
    end

end
