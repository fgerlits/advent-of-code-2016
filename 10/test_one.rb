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

    def setup
        @state = Bots.new(SAMPLE_RULES)
    end

    def test_initialize
        assert_equal({2 => [2, 5], 1 => [3]}, @state.bot_has)
        assert_equal({2 => [['bot', 1], ['bot', 0]],
                      1 => [['output', 1], ['bot', 0]],
                      0 => [['output', 2], ['output', 0]]},
                     @state.handoff_rules)
        assert_equal({}, @state.output)
    end

    def test_give_to_bot
        @state.give_to(15, ['bot', 12])
        assert_equal([15], @state.bot_has[12])
        assert_equal({}, @state.output)
    end

    def test_give_to_bot_again
        @state.give_to(15, ['bot', 12])
        @state.give_to(11, ['bot', 12])
        assert_equal([11, 15], @state.bot_has[12])
        assert_equal({}, @state.output)
    end

    def test_give_too_many_chips_to_bot
        @state.give_to(15, ['bot', 12])
        @state.give_to(11, ['bot', 12])
        assert_raise { give_to(17, ['bot', 12]) }
    end

    def test_give_to_output
        @state.give_to(1, ['output', 2])
        assert_equal({2 => [1]}, @state.output)
    end

    def test_give_to_output_again
        @state.give_to(5, ['output', 2])
        @state.give_to(1, ['output', 2])
        assert_equal({2 => [5, 1]}, @state.output)
    end

    def test_take_one_step
        @state.take_step
        assert_equal({2 => [], 1 => [2, 3], 0 => [5]}, @state.bot_has)
        assert_equal({}, @state.output)
    end

    def test_take_two_steps
        2.times { @state.take_step }
        assert_equal({2 => [], 1 => [], 0 => [3, 5]}, @state.bot_has)
        assert_equal({1 => [2]}, @state.output)
    end

    def test_take_all_steps
        @state.take_all_steps
        assert_equal({2 => [], 1 => [], 0 => []}, @state.bot_has)
        assert_equal({1 => [2], 2 => [3], 0 => [5]}, @state.output)
    end

end
