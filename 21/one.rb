#!/usr/bin/env ruby

def apply_rules(lines, word)
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
                word.split(//).rotate(x).join
            when /rotate right (\w+) step/
                x = $1.to_i
                word.split(//).rotate(-x).join
            when /rotate based on position of letter (\w)/
                index = word.index($1)
                rotations = index >= 4 ? index + 2 : index + 1
                word.split(//).rotate(-rotations).join
            when /reverse positions (\w+) through (\w+)/
                x, y = $1.to_i, $2.to_i
                word[x..y] = word[x..y].reverse
                word
            when /move position (\w+) to position (\w+)/
                x, y = $1.to_i, $2.to_i
                tmp = word[x]
                word[x] = ''
                word[y, 0] = tmp
                word
            else
                raise "could not parse line '#{line.chomp}'"
        end
    end
end

if __FILE__ == $0
    puts apply_rules(ARGF.readlines, 'abcdefgh')
end
