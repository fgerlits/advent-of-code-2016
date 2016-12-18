#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase
    def test_trap?
        assert trap?('^', '^', '.')
        assert trap?('.', '^', '^')
        assert trap?('.', '.', '^')
        assert trap?('^', '.', '.')
        assert ! trap?('.', '.', '.')
        assert ! trap?('.', '^', '.')
        assert ! trap?('^', '.', '^')
        assert ! trap?('^', '^', '^')
    end

    def test_next_row
        assert_equal '.^^^^', next_row('..^^.')
        assert_equal '^^..^', next_row('.^^^^')
    end

    def test_count_traps
        assert_equal 6, count_safe_tiles(3, '..^^.')
        assert_equal 38, count_safe_tiles(10, '.^^.^.^^^^')
    end
end
