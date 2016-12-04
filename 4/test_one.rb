#!/usr/bin/env ruby

require_relative 'one'
require 'test/unit'

class TestOne < Test::Unit::TestCase

    def test_room_name
        assert_equal 'ab-c-def-g-hi', room_name('ab-c-def-g-hi-123[xyz]')
    end

    def test_checksum
        assert_equal 'xyz', checksum('ab-c-def-g-hi-123[xyz]')
    end

    def test_sector_id
        assert_equal 123, sector_id('ab-c-def-g-hi-123[xyz]')
    end

    def test_frequencies
        assert_equal({'a' => 5, 'b' => 2, 'c' => 1, 'd' => 1, 'r' => 2},
                     frequencies('abracadabra'))
    end

    def test_compute_checksum
        assert_equal 'abrcd', compute_checksum('abracadabrax')
    end

    def test_is_real_room
        assert is_real_room('aaaaa-bbb-z-y-x-123[abxyz]')
        assert is_real_room('a-b-c-d-e-f-g-h-987[abcde]')
        assert is_real_room('not-a-real-room-404[oarel]')
        assert ! is_real_room('totally-real-room-200[decoy]')
    end

end
