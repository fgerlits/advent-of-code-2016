#!/usr/bin/env ruby

require_relative '../12/one'

class InstructionWithOut < Instruction
    def initialize(line)
        super
        case line
            when /out (\w+)/
                @instruction = :out
                @x = $1
        end

        if line[0] == '*'
            @print = true
        end
    end

    def call(computer)
        if @print
            puts "registers at @ip=#{computer.ip}: #{computer.registers}"
        end
        super
        case @instruction
            when :out
                puts "outputting signal #{computer.registers[@x]}"
                computer.ip += 1
        end
    end
end

def parse_input(lines)
    lines.map{|line| InstructionWithOut.new(line.chomp)}
end

if __FILE__ == $0
    input = ARGV.shift.to_i
    computer = Computer.new(parse_input(ARGF.readlines))
    computer.registers['a'] = input
    computer.run
end
