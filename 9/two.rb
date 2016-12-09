#!/usr/bin/env ruby

def find_decoded_length(encoded_string)
    i = result = 0
    while i < encoded_string.size
        if /^\((\d+)x(\d+)\)/ =~ encoded_string[i..-1]
            length = $1.to_i
            repeats = $2.to_i
            i += $&.size
            next_length_chars = encoded_string[i, length]
            result += repeats * find_decoded_length(next_length_chars)
            i += length
        else
            i += 1
            result += 1
        end
    end
    result
end

if __FILE__ == $0
    puts find_decoded_length(ARGF.read.chomp)
end
