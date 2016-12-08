#!/usr/bin/env ruby

class TinyScreen
    def initialize(x, y)
        @table = Array.new(x){Array.new(y){'.'}}
    end

    def to_s
        @table.transpose.map{|row| row.join}.join("\n")
    end

    def rect(x, y)
        x.times do |ix|
            y.times do |iy|
                @table[ix][iy] = '#'
            end
        end
    end

    def rotate_column(x, by)
        @table[x].rotate!(-by)
    end

    def rotate_row(y, by)
        rows = @table.transpose
        rows[y].rotate!(-by)
        @table = rows.transpose
    end

    def count_lit_pixels
        @table.map{|column| column.count('#')}.reduce(:+)
    end
end

class Instruction
    def initialize(line)
        case line
            when /rect (\d+)x(\d+)/
                @instr = :rect
                @x = $1.to_i
                @y = $2.to_i
            when /rotate column x=(\d+) by (-?\d+)/
                @instr = :rotate_column
                @column = $1.to_i
                @by = $2.to_i
            when /rotate row y=(\d+) by (-?\d+)/
                @instr = :rotate_row
                @row = $1.to_i
                @by = $2.to_i
        end
    end

    def apply(tiny_screen)
        case @instr
            when :rect
                tiny_screen.rect(@x, @y)
            when :rotate_column
                tiny_screen.rotate_column(@column, @by)
            when :rotate_row
                tiny_screen.rotate_row(@row, @by)
        end
    end
end

def process_input(stream)
    stream.readlines.map{|line| Instruction.new(line.chomp)}
end

def apply_instructions(instructions)
    instructions.each_with_object(TinyScreen.new(50, 6)) do |instruction, tiny_screen|
        instruction.apply(tiny_screen)
    end
end

if __FILE__ == $0
    puts apply_instructions(process_input(ARGF)).count_lit_pixels
end
