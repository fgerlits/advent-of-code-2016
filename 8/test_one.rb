#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def setup
        @ts = TinyScreen.new(7, 3)
    end

    def test_initialize
        assert_equal ".......\n.......\n.......", @ts.to_s
    end

    def test_rect
        @ts.rect(3, 2)
        assert_equal "###....\n###....\n.......", @ts.to_s
    end

    def test_rotate_column
        @ts.rect(3, 2)
        @ts.rotate_column(1, 1)
        assert_equal "#.#....\n###....\n.#.....", @ts.to_s
    end

    def test_rotate_row
        @ts.rect(3, 2)
        @ts.rotate_column(1, 1)
        @ts.rotate_row(0, 4)
        assert_equal "....#.#\n###....\n.#.....", @ts.to_s
    end

    def test_count_lit_pixels
        @ts.rect(3, 2)
        @ts.rotate_column(1, 1)
        @ts.rotate_row(0, 4)
        assert_equal 6, @ts.count_lit_pixels
    end

    def test_instruction_rect
        Instruction.new('rect 3x2').apply(@ts)
        assert_equal "###....\n###....\n.......", @ts.to_s
    end

    def test_instruction_rotate_column
        Instruction.new('rect 3x2').apply(@ts)
        Instruction.new('rotate column x=1 by 1').apply(@ts)
        assert_equal "#.#....\n###....\n.#.....", @ts.to_s
    end

    def test_instruction_rotate_row
        Instruction.new('rect 3x2').apply(@ts)
        Instruction.new('rotate column x=1 by 1').apply(@ts)
        Instruction.new('rotate row y=0 by 4').apply(@ts)
        assert_equal "....#.#\n###....\n.#.....", @ts.to_s
    end
end
