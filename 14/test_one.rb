#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def test_find_quintuplets
        assert_equal({}, find_quintuplets(['foo', 'bar']))
        assert_equal({'b' => [1, 2], 'f' => [2]},
                     find_quintuplets(['aaa', 'abbbbbc', 'bbbbb-fffff']))
    end

    def test_is_good
        assert is_good('abbbc', 0, {'a' => [10], 'b' => [0, 1]})
        assert is_good('abbbc', 0, {'a' => [10], 'b' => [500]})
        assert is_good('abbbc', 0, {'a' => [10], 'b' => [1000, 2000]})
        assert ! is_good('abbbc', 0, {'a' => [10], 'b' => [0]})
        assert ! is_good('abbbc', 0, {'a' => [10], 'b' => [1001]})
        assert ! is_good('abbcb', 0, {'a' => [10], 'b' => [500]})
    end

    def test_find_good_indices
        hashes = open('abc.md5sums').readlines.map{|line| line.chomp}
        good_indices = find_good_indices(hashes)
        assert_equal 39, good_indices[0]
        assert_equal 92, good_indices[1]
        assert_equal 22728, good_indices[63]
    end
end
