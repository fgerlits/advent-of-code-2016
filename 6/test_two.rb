#!/usr/bin/env ruby

require_relative 'two'
require 'test/unit'

class TestTwo < Test::Unit::TestCase

    def test_least_frequent
        assert_equal(3,
                     least_frequent([0, 1, 2, 3, 0, 1, 2]))
    end

    def test_solve
        assert_equal('advent',
                     solve(process_input(open('test_input'))))
    end

end
