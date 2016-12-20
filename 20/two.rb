#!/usr/bin/env ruby

require_relative 'one'

def count_uncovered(min, max, intervals)
    uncovered = 0
    candidate = 0
    intervals.sort.each do |interval|
        if interval[0] > candidate
            uncovered += interval[0] - candidate
        end
        candidate = [interval[1] + 1, candidate].max
    end
    if max >= candidate
        uncovered += max - candidate + 1
    end
    uncovered
end

if __FILE__ == $0
    puts count_uncovered(0, (1 << 32) - 1, process_input(ARGF.readlines))
end
