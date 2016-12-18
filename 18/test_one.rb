#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase
    def test_trap?
        assert trap?(true, true, false)
        assert trap?(false, true, true)
        assert trap?(false, false, true)
        assert trap?(true, false, false)
        assert ! trap?(false, false, false)
        assert ! trap?(false, true, false)
        assert ! trap?(true, false, true)
        assert ! trap?(true, true, true)
    end

    def test_next_row
        assert_equal process_input('.^^^^'),
                     next_row(process_input('..^^.'))
        assert_equal process_input('^^..^'),
                     next_row(process_input('.^^^^'))
    end

    def test_count_traps
        assert_equal 6, count_safe_tiles(3, process_input('..^^.'))
        assert_equal 38, count_safe_tiles(10, process_input('.^^.^.^^^^'))
    end

    def test_process_input
        assert_equal [false, true, true], process_input('.^^')
    end
end
