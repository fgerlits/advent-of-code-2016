#!/usr/bin/env ruby

require_relative 'one'

if __FILE__ == $0
    state = Bots.new(ARGF.readlines) 
    state.take_all_steps
    puts state.output.values_at(0, 1, 2).flatten.inject(:*)
end
