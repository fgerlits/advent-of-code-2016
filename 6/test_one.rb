#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def test_process_input
        assert_equal([['a', 'A'], ['b', 'B'], ['c', 'C']],
                     process_input(["abc\n", "ABC\n"]))
    end

    def test_most_frequent
        assert_equal(5,
                     most_frequent([3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]))
    end

    def test_solve
        assert_equal('easter',
                     solve(process_input(open('test_input'))))
    end
end
