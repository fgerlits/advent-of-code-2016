#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def test_lowest_uncovered
        assert_equal 3, lowest_uncovered([[5, 8], [0, 2], [4, 7]])
        assert_equal 9, lowest_uncovered([[5, 8], [0, 4], [2, 7]])
    end

    def test_process_input
        assert_equal [[5, 8], [0, 2], [4, 7]], process_input(<<~EOF.split("\n"))
                     5-8
                     0-2
                     4-7
                     EOF
    end

end
