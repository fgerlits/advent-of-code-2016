#!/usr/bin/env ruby

def is_abba?(word)
    word[0] == word[3] && word[1] == word[2] && word[0] != word[1]
end

def contains_abba?(word)
    word.each_char.each_cons(4).any?{|x| is_abba?(x)}
end

BETWEEN_SQUARE_BRACKETS = /\[[^\]]*\]/

def partition(word)
    [word.split(BETWEEN_SQUARE_BRACKETS) - [''],
     word.scan(BETWEEN_SQUARE_BRACKETS).map{|s| s[1...-1]}]
end

def supports_TLS?(word)
    good, bad = partition(word)
    good.any?{|x| contains_abba?(x)} && ! bad.any?{|x| contains_abba?(x)}
end

if __FILE__ == $0
    puts ARGF.readlines.count{|line| supports_TLS?(line.chomp)}
end
