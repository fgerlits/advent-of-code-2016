#!/usr/bin/env ruby

def find_quintuplets(hashes)
    quintuplets = Hash.new{[]}
    hashes.each_with_index do |hash, i|
        hash.scan(/(.)\1\1\1\1/).each do |match|
            quintuplets[match[0]] += [i]
        end
    end
    quintuplets
end

def is_good(hash, index, quintuplets)
    /(.)\1\1/ =~ hash && quintuplets[$1].any?{|i|
        i > index && i <= index + 1000
    }
end

def find_good_indices(hashes)
    quintuplets = find_quintuplets(hashes)
    good_indices = []
    hashes.each_with_index do |hash, i|
        if is_good(hash, i, quintuplets)
            good_indices << i
        end
    end
    good_indices
end

if __FILE__ == $0
    hashes = ARGF.readlines.map{|line| line.chomp}
    good_indices = find_good_indices(hashes)
    puts good_indices[63]
end
