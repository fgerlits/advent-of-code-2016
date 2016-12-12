#!/usr/bin/env ruby

require_relative 'one'

if __FILE__ == $0
    computer = Computer.new(parse_input(ARGF.readlines))
    computer.registers['c'] = 1
    computer.run
    puts computer.registers['a']
end
