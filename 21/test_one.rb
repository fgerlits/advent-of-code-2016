#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def test_apply_one_rule
        assert_equal "cbad", apply_rules(['swap position 0 with position 2'], 'abcd')
    end

    def test_apply_rules
        assert_equal 'decab', apply_rules(<<~EOF.split("\n"), 'abcde')
					swap position 4 with position 0
					swap letter d with letter b
					reverse positions 0 through 4
					rotate left 1 step
					move position 1 to position 4
					move position 3 to position 0
					rotate based on position of letter b
					rotate based on position of letter d
					EOF
	end

end
