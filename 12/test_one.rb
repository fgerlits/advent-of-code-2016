#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

SAMPLE_INPUT = <<~EOF.split("\n")
    cpy 41 a
    inc a
    inc a
    dec a
    jnz a 2
    dec a
    EOF

class TestGlobals < Test::Unit::TestCase
    def test_parse_input
        input = parse_input(SAMPLE_INPUT)
        assert_equal 6, input.size
    end
end

class TestInstruction < Test::Unit::TestCase
    def setup
        @computer = Computer.new([])
    end

    def test_copy_integer
        Instruction.new('cpy 41 a').apply(@computer)
        assert_equal 41, @computer.registers['a']
        assert_equal 1, @computer.ip
    end

    def test_copy_register
        @computer.registers['a'] = 7
        Instruction.new('cpy a b').apply(@computer)
        assert_equal 7, @computer.registers['b']
        assert_equal 1, @computer.ip
    end

    def test_increment
        Instruction.new('inc c').apply(@computer)
        assert_equal 1, @computer.registers['c']
        assert_equal 1, @computer.ip
    end

    def test_decrement
        Instruction.new('dec d').apply(@computer)
        assert_equal -1, @computer.registers['d']
        assert_equal 1, @computer.ip
    end

    def test_jump_when_non_zero
        @computer.registers['a'] = 1
        Instruction.new('jnz a 2').apply(@computer)
        assert_equal 2, @computer.ip
    end

    def test_dont_jump_when_zero
        @computer.registers['a'] = 0
        Instruction.new('jnz a 2').apply(@computer)
        assert_equal 1, @computer.ip
    end
end

class TestComputer < Test::Unit::TestCase
    def test_sample_program
        computer = Computer.new(parse_input(SAMPLE_INPUT))
        computer.run
        assert_equal({ 'a' => 42, 'b' => 0, 'c' => 0, 'd' => 0 },
                     computer.registers)
        assert_equal(6,
                     computer.ip)
    end
end
