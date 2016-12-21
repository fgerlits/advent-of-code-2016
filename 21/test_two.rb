#!/usr/bin/env ruby

require_relative 'one'
require_relative 'two'
require 'test/unit'

RULES = <<~EOF.split("\n")
    swap position 4 with position 0
    swap letter d with letter b
    reverse positions 0 through 4
    rotate left 1 step
    move position 1 to position 4
    move position 3 to position 0
    rotate based on position of letter b
    rotate based on position of letter d
    EOF

class TestTwo < Test::Unit::TestCase

    def test_unapply_one_rule
        assert_equal 'abcd',
            unapply_rules(['swap position 0 with position 2'], 'cbad')
    end

    def test_apply_rules
        assert_equal 'abcdefgh',
            unapply_rules(RULES.reverse, apply_rules(RULES, 'abcdefgh'))
	end

end
