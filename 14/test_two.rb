#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def test_find_good_indices
        hashes = open('abc.stretched-md5sums').readlines \
                                              .map{|line| line.chomp}
        good_indices = find_good_indices(hashes)
        assert_equal 10, good_indices[0]
        assert_equal 22551, good_indices[63]
    end
end
