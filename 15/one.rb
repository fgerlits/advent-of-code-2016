#!/usr/bin/env ruby

def process_input(lines)
    lines.map do |line|
        /has (\d+) positions.*is at position (\d+)/ =~ line
        [$1.to_i, $2.to_i]
    end
end

def falls_through(wheel, index, at_time)
    size, slot = wheel
    (at_time + index + slot) % size == 0
end

def falls_through_all(wheels, at_time)
    wheels.each_with_index.all? do |wheel, index|
        falls_through(wheel, index + 1, at_time)
    end
end

def integers_from(n)
    Enumerator.new do |block|
        loop do
            block.yield n
            n += 1
        end
    end
end

def solve(wheels)
    integers_from(0).find{|time| falls_through_all(wheels, time)}
end

if __FILE__ == $0
    puts solve(process_input(ARGF.readlines))
end
