#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def test_is_triangle
        assert(is_triangle([3, 4, 5]))
        assert(is_triangle([5, 4, 3]))
        assert(is_triangle([5, 3, 4]))

        assert(! is_triangle([5, 10, 25]))
    end

    def test_count_triangles
        assert_equal(3, count_triangles([[3, 4, 5], [5, 4, 3], [5, 3, 4], [5, 10, 25]]))
    end

end
