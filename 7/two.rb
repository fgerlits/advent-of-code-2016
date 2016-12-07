#!/usr/bin/env ruby

require_relative 'one'

def is_aba?(word)
    word[0] == word[2] && word[0] != word[1]
end

def abas(word)
    word.each_char.each_cons(3).select{|x| is_aba?(x)}.map(&:join)
end

def all_abas(words)
    words.map{|w| abas(w)}.flatten(1)
end

def reverse_aba(aba)
    aba[1] + aba[0] + aba[1]
end

def has_common_element?(x, y)
    !(x & y).empty?
end

def supports_SSL?(input)
    outside, inside = partition(input)
    outside_abas = all_abas(outside)
    inside_babs = all_abas(inside).map{|x| reverse_aba(x)}
    has_common_element?(outside_abas, inside_babs)
end

if __FILE__ == $0
    puts ARGF.readlines.count{|line| supports_SSL?(line.chomp)}
end
