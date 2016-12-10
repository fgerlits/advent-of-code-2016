#!/usr/bin/env ruby

require_relative 'one'

if __FILE__ == $0
    bot_has, handoff_rules = process_input(ARGF.readlines) 
    output = {} 
    take_all_steps(bot_has, handoff_rules, output)
	puts output.values_at(0, 1, 2).flatten.inject(:*)
end
