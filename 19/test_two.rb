#!/usr/bin/env ruby

require_relative 'two'
require 'test/unit'

class TestTwo < Test::Unit::TestCase

    def test_solve
        assert_equal [1, 1, 3, 1, 2, 3, 5, 7, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 13],
                     (1..20).map{|n| solve(n)}
    end

    def test_solve_analytically
        assert_equal [1, 1, 3, 1, 2, 3, 5, 7, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 13],
                     (1..20).map{|n| solve_analytically(n)}
    end

end
