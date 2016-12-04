#!/usr/bin/env ruby

require_relative 'one'

def rotate(char, rotations)
    offset = char.ord - 'a'.ord
    rotated_offset = (offset + rotations) % 26
    ('a'.ord + rotated_offset).chr
end

def decrypt(room_name, sector_id)
    room_name.each_char.map do |c|
        case c
            when '-' then ' '
            else rotate(c, sector_id)
        end
    end.join
end

if __FILE__ == $0
    results = ARGF.each_line \
                  .select{|line| is_real_room(line)} \
                  .map do |line|
                      room = room_name(line)
                      id = sector_id(line)
                      "#{decrypt(room, id)} => #{id}"
                  end
    puts results.grep(/north/)
end
