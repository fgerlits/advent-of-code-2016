#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

SAMPLE_RULES = <<~EOF.split("\n")
    value 5 goes to bot 2
    bot 2 gives low to bot 1 and high to bot 0
    value 3 goes to bot 1
    bot 1 gives low to output 1 and high to bot 0
    bot 0 gives low to output 2 and high to output 0
    value 2 goes to bot 2
EOF

class TestOne < Test::Unit::TestCase

    def test_process_input
        assert_equal [{2 => [2, 5], 1 => [3]},
                      {2 => [['bot', 1], ['bot', 0]],
                       1 => [['output', 1], ['bot', 0]],
                       0 => [['output', 2], ['output', 0]]}],
                     process_input(SAMPLE_RULES)
    end
        
end

class TestGiveTo < Test::Unit::TestCase

    def setup
        @bot_has = {}
        @output = {}
    end

    def test_give_to_bot
        give_to(1, ['bot', 2], @bot_has, @output)
        assert_equal({2 => [1]}, @bot_has)
        assert_equal({}, @output)
    end

    def test_give_to_bot_again
        give_to(5, ['bot', 2], @bot_has, @output)
        give_to(1, ['bot', 2], @bot_has, @output)
        assert_equal({2 => [1, 5]}, @bot_has)
        assert_equal({}, @output)
    end

    def test_give_too_many_chips_to_bot
        give_to(5, ['bot', 2], @bot_has, @output)
        give_to(1, ['bot', 2], @bot_has, @output)
        assert_raise { give_to(7, ['bot', 2], @bot_has, @output) }
    end

    def test_give_to_output
        give_to(1, ['output', 2], @bot_has, @output)
        assert_equal({}, @bot_has)
        assert_equal({2 => [1]}, @output)
    end

    def test_give_to_output_again
        give_to(5, ['output', 2], @bot_has, @output)
        give_to(1, ['output', 2], @bot_has, @output)
        assert_equal({}, @bot_has)
        assert_equal({2 => [5, 1]}, @output)
    end

end

class TestTakeStep < Test::Unit::TestCase

    def setup
        @bot_has, @handoff_rules = process_input(SAMPLE_RULES)
        @output = {}
        assert_equal [{2 => [2, 5], 1 => [3]}, {}], [@bot_has, @output]
    end

    def test_take_one_step
        take_step(@bot_has, @handoff_rules, @output)
        assert_equal [{2 => [], 1 => [2, 3], 0 => [5]}, {}],
                     [@bot_has, @output]
    end

    def test_take_two_steps
        2.times { take_step(@bot_has, @handoff_rules, @output) }
        assert_equal [{2 => [], 1 => [], 0 => [3, 5]}, {1 => [2]}],
                     [@bot_has, @output]
    end

    def test_take_all_steps
        take_all_steps(@bot_has, @handoff_rules, @output)
        assert_equal [{2 => [], 1 => [], 0 => []}, {1 => [2], 2 => [3], 0 => [5]}],
                     [@bot_has, @output]
    end

end
