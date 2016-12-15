#!/usr/bin/env ruby

require_relative 'one'

if __FILE__ == $0
    wheels = process_input(ARGF.readlines)
    wheels << [11, 0]
    puts solve(wheels)
end
