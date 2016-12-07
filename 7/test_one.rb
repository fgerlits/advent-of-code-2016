#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def test_is_abba?
        assert is_abba?('xyyx')
        assert ! is_abba?('abcd')
        assert ! is_abba?('aaaa')
    end

    def test_contains_abba?
        assert ! contains_abba?('x')
        assert contains_abba?('xyyx')
        assert contains_abba?('ioxxojzxcvbn')
        assert ! contains_abba?('abcdefghijklmnopqrstuvwxyz')
    end

    def test_partition
        assert_equal([['abba', 'qrst'], ['mnop']],
                     partition('abba[mnop]qrst'))
        assert_equal([['a', 'c', 'fg', 'ijk'], ['b', 'd', 'e', 'h']],
                     partition('a[b]c[d][e]fg[h]ijk'))
    end

    def test_supports_TLS?
        assert supports_TLS?('abba[mnop]qrst')
        assert ! supports_TLS?('abcd[bddb]xyyx')
        assert ! supports_TLS?('aaaa[qwer]tyui')
        assert supports_TLS?('ioxxoj[asdfgh]zxcvbn')
    end

end
