#!/usr/bin/env ruby

require_relative 'enumerable-util'
require 'test/unit'

class TestEnumerableUtil < Test::Unit::TestCase

    def test_frequencies
        assert_equal({}, [].frequencies)
        assert_equal({3 => 2, 1 => 2, 4 => 1, 5 => 3, 9 => 1, 6 => 1, 2 => 1},
                     [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5].frequencies)
        assert_equal({'a' => 5, 'b' => 2, 'c' => 1, 'd' => 1, 'r' => 2},
                     'abracadabra'.each_char.frequencies)
    end

end

