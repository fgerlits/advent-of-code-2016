#!/usr/bin/env ruby

def checksum_one(word)
    word.each_slice(2).map{|x, y| x == y ? 1 : 0}
end

def checksum(input)
    while input.size.even?
        input = checksum_one(input)
    end
    input.join
end

def reverse_and_invert(input)
    input.reverse.map{|d| 1 - d}
end

def dragonify_one(input)
    input + [0] + reverse_and_invert(input)
end

def dragonify(input, target_length)
    while input.size < target_length
        input = dragonify_one(input)
    end
    input[0...target_length]
end

def process_input(word)
    word.each_char.map{|c| c.to_i}
end

def solve(input, target_length)
    checksum(dragonify(input, target_length))
end

if __FILE__ == $0
    input = process_input(ARGV[0])
    target_length = ARGV[1].to_i
    puts solve(input, target_length)
end
