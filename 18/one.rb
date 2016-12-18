#!/usr/bin/env ruby

def trap?(x, y, z)
    x != z
end

def next_row(row)
    ([false] + row + [false]).each_cons(3).map do |x, y, z|
        trap?(x, y, z)
    end
end

def count_safe_tiles(num_rows, first_row)
    num_safe_tiles = 0
    row = first_row
    num_rows.times do
        num_safe_tiles += row.count(false)
        row = next_row(row)
    end
    num_safe_tiles
end

def process_input(input)
    input.each_char.map{|c| c == '^'}
end

if __FILE__ == $0
    num_rows = ARGV.shift.to_i
    first_row = process_input(ARGF.read.chomp)
    puts count_safe_tiles(num_rows, first_row)
end
