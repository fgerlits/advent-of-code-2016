#!/usr/bin/env ruby

FORMAT = /(?<room_name>([a-z]+-)*)(?<sector_id>[0-9]+)\[(?<checksum>[a-z]+)\]/

def room_name(input)
    FORMAT.match(input)[:room_name].chop
end

def checksum(input)
    FORMAT.match(input)[:checksum]
end

def sector_id(input)
    FORMAT.match(input)[:sector_id].to_i
end

def frequencies(word)
    word.each_char.each_with_object(Hash.new(0)) do |c, freqs|
        freqs[c] += 1
    end
end

def compute_checksum(word)
    frequencies(word).map{|c, freq| [-freq, c]}.sort.take(5) \
        .map{|freq, c| c}.join
end

def is_real_room(input)
    compute_checksum(room_name(input).delete('-')) == checksum(input)
end

if __FILE__ == $0
    input = ARGF.readlines
    puts input.select{|line| is_real_room(line)} \
              .map{|line| sector_id(line)} \
              .reduce(:+)
end
