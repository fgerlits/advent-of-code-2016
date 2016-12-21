#!/usr/bin/env ruby

REVERSE_POS_MAPPING = (0..7).map{|i|
    [i >= 4 ? (2*i + 2) % 8 : 2*i + 1, i]}.to_h

def reverse_shift(new_pos)
    old_pos = REVERSE_POS_MAPPING[new_pos]
    old_pos - new_pos
end

def unapply_rules(lines, word)
    lines.reduce(word) do |word, line|
        case line
            when /swap position (\w+) with position (\w+)/
                x, y = $1.to_i, $2.to_i
                word[x], word[y] = word[y], word[x]
                word
            when /swap letter (\w) with letter (\w)/
                x, y = $1, $2
                word.gsub(x, '@').gsub(y, x).gsub('@', y)
            when /rotate left (\w+) step/
                x = $1.to_i
                word.split(//).rotate(-x).join
            when /rotate right (\w+) step/
                x = $1.to_i
                word.split(//).rotate(x).join
            when /rotate based on position of letter (\w)/
                index = word.index($1)
                rotations = reverse_shift(index)
                word.split(//).rotate(-rotations).join
            when /reverse positions (\w+) through (\w+)/
                x, y = $1.to_i, $2.to_i
                word[x..y] = word[x..y].reverse
                word
            when /move position (\w+) to position (\w+)/
                x, y = $1.to_i, $2.to_i
                tmp = word[y]
                word[y] = ''
                word[x, 0] = tmp
                word
            else
                raise "could not parse line '#{line.chomp}'"
        end
    end
end

if __FILE__ == $0
    puts unapply_rules(ARGF.readlines.reverse, 'fbgdceah')
end
