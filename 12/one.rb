#!/usr/bin/env ruby

class Computer
    attr_accessor :ip, :registers

    def initialize(program)
        @program = program
        @ip = 0
        @registers = {'a' => 0, 'b' => 0, 'c' => 0, 'd' => 0 }
    end

    def run
        while @ip >= 0 && @ip < @program.size
            @program[@ip].apply(self)
        end
    end
end

class Instruction
    def initialize(line)
        case line
            when /cpy (\d+) (\w+)/
                @instruction = lambda do |computer|
                    computer.registers[$2] = $1.to_i
                    computer.ip += 1
                end
            when /cpy (\w+) (\w+)/
                @instruction = lambda do |computer|
                    computer.registers[$2] = computer.registers[$1]
                    computer.ip += 1
                end
            when /inc (\w+)/
                @instruction = lambda do |computer|
                    computer.registers[$1] += 1
                    computer.ip += 1
                end
            when /dec (\w+)/
                @instruction = lambda do |computer|
                    computer.registers[$1] -= 1
                    computer.ip += 1
                end
            when /jnz (\w+) (-?\d+)/
                @instruction = lambda do |computer|
                    if computer.registers[$1] != 0
                        computer.ip += $2.to_i
                    else
                        computer.ip += 1
                    end
                end
        end
    end

    def apply(computer)
        @instruction.call(computer)
    end
end

def parse_input(lines)
    lines.map{|line| Instruction.new(line.chomp)}
end

if __FILE__ == $0
    computer = Computer.new(parse_input(ARGF.readlines))
    computer.run
    puts computer.registers['a']
end
