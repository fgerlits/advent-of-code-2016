#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase
    def test_checkum_one
        assert_equal process_input('110101'),
                     checksum_one(process_input('110010110100'))
        assert_equal process_input('100'),
                     checksum_one(process_input('110101'))
    end

    def test_checksum
        assert_equal '100',
                     checksum(process_input('110010110100'))
    end

    def test_dragonify_one
        assert_equal process_input('10000011110'),
                     dragonify_one(process_input('10000'))
        assert_equal process_input('10000011110010000111110'),
                     dragonify_one(process_input('10000011110'))
    end

    def test_dragonify
        assert_equal process_input('10000011110010000111'),
                     dragonify(process_input('10000011110'), 20)
    end

    def test_process_input
        assert_equal [1, 0, 1, 1], process_input('1011')
    end

    def test_solve
        assert_equal '01100', solve(process_input('10000'), 20)
    end
end
