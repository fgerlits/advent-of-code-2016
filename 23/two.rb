#!/usr/bin/env ruby

require_relative 'one'

if __FILE__ == $0
    computer = ComputerWithToggle.new(parse_input(ARGF.readlines))
    computer.registers['a'] = 12
    computer.run
    puts computer.registers['a']
end
