#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

SAMPLE_INPUT = <<~EOF.split("\n")
	cpy 2 a
	tgl a
	tgl a
	tgl a
	cpy 1 a
	dec a
	dec a
EOF

class TestOne < Test::Unit::TestCase

    def test_program_with_toggle
		computer = ComputerWithToggle.new(parse_input(SAMPLE_INPUT))
        computer.run
        assert_equal({ 'a' => 3, 'b' => 0, 'c' => 0, 'd' => 0 },
                     computer.registers)
        assert_equal(7,
                     computer.ip)

    end

end
