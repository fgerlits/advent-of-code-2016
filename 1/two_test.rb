#!/usr/bin/env ruby

require_relative 'two'
require 'test/unit'

class TestTwo < Test::Unit::TestCase

    def test_add
        assert_equal([5, 3], add([4, 3], [1, 0]))
    end

    def test_in_between
        assert_equal([[0, 1], [0, 2], [0, 3]],
                     in_between([0, 0], [0, 3], [0, 1]))
    end

    def test_solve
        assert_equal(4, solve('R8, R4, R4, R8'))
    end

end
