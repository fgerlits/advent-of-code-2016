#!/usr/bin/env ruby

# I cheated: I knew this one, it is the Josephus problem,
# defined by the recursion:
# f(1) = 0
# f(2x) = 2f(x)
# f(2x + 1) = 2f(x) + 2
# and the solution is 2*(n - 2^k) where 2^k <= n < 2^{k+1}
# (plus 1 because we are counting elves from 1 instead of 0).

def josephus(n)
    binary = n.to_s(2)
    minus_top_digit = binary[1..-1]
    2 * minus_top_digit.to_i(2) + 1
end

if __FILE__ == $0
    puts josephus(ARGV[0].to_i)
end
