#!/usr/bin/env ruby

require_relative 'two'
require 'test/unit'

class TestTwo < Test::Unit::TestCase

    def test_count_uncovered
        assert_equal 2, count_uncovered(0, 9, [[5, 8], [0, 2], [4, 7]])
        assert_equal 1, count_uncovered(0, 9, [[5, 8], [0, 4], [2, 7]])
        assert_equal 5, count_uncovered(0, 9, [[5, 8], [4, 7]])
    end

end
