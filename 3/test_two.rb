#!/usr/bin/env ruby

require_relative 'two'
require 'test/unit'

class TestTwo < Test::Unit::TestCase

    def test_transpose_input
        assert_equal([[101, 102, 103],
                      [201, 202, 203],
                      [301, 302, 303],
                      [401, 402, 403],
                      [501, 502, 503],
                      [601, 602, 603]],
                     transpose_input([[101, 301, 501],
                                      [102, 302, 502],
                                      [103, 303, 503],
                                      [201, 401, 601],
                                      [202, 402, 602],
                                      [203, 403, 603]]))
    end

end
