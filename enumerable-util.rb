#!/usr/bin/env ruby

module Enumerable

    def frequencies
        each_with_object(Hash.new(0)) do |elem, freqs|
            freqs[elem] += 1
        end
    end

    def sum
        reduce(0, :+)
    end

end
