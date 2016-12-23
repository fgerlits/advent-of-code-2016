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
            @program[@ip].call(self)
        end
    end
end

def is_register(word)
    word.size == 1 && 'a' <= word && word <= 'd'
end

def is_number(word)
    word =~ /-?\d+/
end

class Instruction
    def initialize(line)
        case line
            when /cpy (\S+) (\S+)/
                @instruction = :copy
                @x, @y = $1, $2
            when /inc (\S+)/
                @instruction = :increment
                @x = $1
            when /dec (\S+)/
                @instruction = :decrement
                @x = $1
            when /jnz (\S+) (\S+)/
                @instruction = :jump_non_zero
                @x, @y = $1, $2
        end
    end

    def call(computer)
        case @instruction
            when :copy
                if is_register(@y)
                    if is_register(@x)
                        computer.registers[@y] = computer.registers[@x]
                    elsif is_number(@x)
                        computer.registers[@y] = @x.to_i
                    end
                end
                computer.ip += 1

            when :increment
                if is_register(@x)
                    computer.registers[@x] += 1
                end
                computer.ip += 1

            when :decrement
                if is_register(@x)
                    computer.registers[@x] -= 1
                end
                computer.ip += 1

            when :jump_non_zero
                if is_register(@x) && computer.registers[@x] != 0 \
                                 || is_number(@x) && @x.to_i != 0
                    if is_register(@y)
                        computer.ip += computer.registers[@y]
                    elsif is_number(@y)
                        computer.ip += @y.to_i
                    else
                        computer.ip += 1
                    end
                else
                    computer.ip += 1
                end
        end
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
