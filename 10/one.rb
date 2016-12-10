#!/usr/bin/env ruby

class Bots
    attr_reader :bot_has, :handoff_rules, :output

    def initialize(lines)
        @bot_has = {}
        @handoff_rules = {}
        lines.each do |line|
            case line
                when /value (\d+) goes to bot (\d+)/
                    @bot_has[$2.to_i] ||= []
                    @bot_has[$2.to_i] += [$1.to_i]
                when /bot (\d+) gives low to (bot|output) (\d+) and high to (bot|output) (\d+)/
                    @handoff_rules[$1.to_i] = [[$2, $3.to_i], [$4, $5.to_i]]
            end
        end
        bot_has.each{|bot, chips| chips.sort!}
        @output = {}
    end

    def give_to(chip, rule)
        target, number = *rule
        case target
            when 'bot'
                bot = @bot_has[number] ||= []
                bot << chip
                if bot.size == 2
                    bot.sort!
                elsif bot.size > 2
                    raise "bot #{number} has more than 2 chips: #{bot.inspect}"
                end
            when 'output'
                @output[number] ||= []
                @output[number] << chip
        end
    end

    def take_step
        @bot_has.select{|bot, chips| chips.size == 2}.each do |bot, chips|
            rule = @handoff_rules[bot]
            puts "bot #{bot} gives " +
                 "#{chips[0]} to #{rule[0][0]} #{rule[0][1]} and it gives " +
                 "#{chips[1]} to #{rule[1][0]} #{rule[1][1]}"
            give_to(chips[0], rule[0])
            give_to(chips[1], rule[1])
            chips.clear
        end.empty?
    end

    def take_all_steps
        loop do
            finished = take_step
            break if finished
        end
    end
end

if __FILE__ == $0
    Bots.new(ARGF.readlines).take_all_steps
end
