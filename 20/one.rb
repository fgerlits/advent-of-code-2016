#!/usr/bin/env ruby

def lowest_uncovered(intervals)
    candidate = 0
    intervals.sort.each do |interval|
        if interval[0] > candidate
            return candidate
        else
            candidate = [interval[1] + 1, candidate].max
        end
    end
    return candidate
end

def process_input(input)
    input.map{|line| line.chomp.split('-').map{|s| s.to_i}}
end

if __FILE__ == $0
    puts lowest_uncovered(process_input(ARGF.readlines))
end
