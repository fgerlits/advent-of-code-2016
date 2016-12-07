#!/usr/bin/env ruby

require_relative 'two'
require 'test/unit'

class TestTwo < Test::Unit::TestCase

    def test_is_aba?
        assert is_aba?('xyx')
        assert ! is_aba?('xxx')
    end

    def test_abas
        assert_equal [], abas('xyyx')
        assert_equal ['aba', 'bab'], abas('abab')
    end

    def test_all_abas
        assert_equal ['aba', 'xzx'], all_abas(['abax', 'yxzx'])
    end

    def test_reverse_aba
        assert_equal 'bab', reverse_aba('aba')
    end

    def test_has_common_element?
        assert has_common_element?([1, 2, 3], [0, 2, 4, 6])
        assert ! has_common_element?([1, 2, 3], [4, 5, 6])
    end

    def test_supports_SSL?
        assert supports_SSL?('aba[bab]xyz')
        assert ! supports_SSL?('xyx[xyx]xyx')
        assert supports_SSL?('aaa[kek]eke')
        assert supports_SSL?('zazbz[bzb]cdb')
    end

end
