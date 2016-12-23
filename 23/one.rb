#!/usr/bin/env ruby

require_relative '../12/one'

class ComputerWithToggle < Computer
    def toggle_instruction(register)
        ip_to_toggle = @ip + @registers[register]
        if ! @program[ip_to_toggle].nil?
            @program[ip_to_toggle].toggle
        end
    end
end

class InstructionWithToggle < Instruction
    def initialize(line)
        super
        case line
            when /tgl (\w+)/
                @instruction = :toggle
                @x = $1
        end
    end

    def call(computer)
        super
        case @instruction
            when :toggle
                computer.toggle_instruction(@x)
                computer.ip += 1
        end
    end

    def toggle
        @instruction = case @instruction
            when :increment             then :decrement
            when :decrement, :toggle    then :increment
            when :jump_non_zero         then :copy
            when :copy                  then :jump_non_zero
        end
    end
end

def parse_input(lines)
    lines.map{|line| InstructionWithToggle.new(line.chomp)}
end

if __FILE__ == $0
    computer = ComputerWithToggle.new(parse_input(ARGF.readlines))
    computer.registers['a'] = 7
    computer.run
    puts computer.registers['a']
end
