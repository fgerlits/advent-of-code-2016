#!/usr/bin/env ruby

require_relative 'two'
require 'test/unit'

class TestTwo < Test::Unit::TestCase

    def test_rotate
        assert_equal 'x', rotate('x', 0)
        assert_equal 'x', rotate('x', 26)
        assert_equal 'z', rotate('x', 2)
        assert_equal 'b', rotate('x', 4)
    end

    def test_decrypt
        assert_equal 'very encrypted name',
                     decrypt('qzmt-zixmtkozy-ivhz', 343)
    end

end
