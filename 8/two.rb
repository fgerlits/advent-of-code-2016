#!/usr/bin/env ruby

require_relative 'one'

if __FILE__ == $0
    puts apply_instructions(process_input(ARGF))
end
