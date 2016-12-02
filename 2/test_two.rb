#!/usr/bin/env ruby

require_relative 'two'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def test_move_one
        assert_equal('5', Keypad.new.move_one!('U').value)
        assert_equal('5', Keypad.new.move_one!('D').value)
        assert_equal('5', Keypad.new.move_one!('L').value)
        assert_equal('6', Keypad.new.move_one!('R').value)
    end

    def test_move
        assert_equal('5', Keypad.new.move!('UD').value)
        assert_equal('6', Keypad.new.move!('UR').value)
        assert_equal('7', Keypad.new.move!('LDRR').value)
        assert_equal('D', Keypad.new.move!('LURRDDLL').value)
        
        keypad = Keypad.new
        assert_equal('5', keypad.move!('ULL').value)
        assert_equal('D', keypad.move!('RRDDD').value)
        assert_equal('B', keypad.move!('LURDL').value)
        assert_equal('3', keypad.move!('UUUUD').value)
    end

    def test_solve
        assert_equal('5DB3', solve(['ULL', 'RRDDD', 'LURDL', 'UUUUD']))
    end

end
