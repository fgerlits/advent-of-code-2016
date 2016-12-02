#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def test_move_one
        assert_equal(5, Keypad.new.move_one!('U').value)
        assert_equal(5, Keypad.new.move_one!('D').value)
        assert_equal(5, Keypad.new.move_one!('L').value)
        assert_equal(6, Keypad.new.move_one!('R').value)
    end

    def test_move
        assert_equal(5, Keypad.new(5).move!('UD').value)
        assert_equal(6, Keypad.new(5).move!('UR').value)
        assert_equal(7, Keypad.new(5).move!('LDRR').value)
        assert_equal(7, Keypad.new(5).move!('LURRDDLL').value)
        
        assert_equal(1, Keypad.new(5).move!('ULL').value)
        assert_equal(9, Keypad.new(1).move!('RRDDD').value)
        assert_equal(8, Keypad.new(9).move!('LURDL').value)
        assert_equal(5, Keypad.new(8).move!('UUUUD').value)
    end

    def test_solve
        assert_equal('1985', solve(['ULL', 'RRDDD', 'LURDL', 'UUUUD']))
    end

end
