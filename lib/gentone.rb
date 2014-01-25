require_relative "gentone/version"
require "coreaudio"
require "querinator"
require_relative "gentone/generate"
require_relative "gentone/pounder"
require_relative "gentone/sender"

module Gentone
  class Runner
    def initialize(filename="01-eish.json")
      @path = File.absolute_path(File.join(File.dirname(__FILE__), "..", "spec", filename))
    end

    def run
      sender = Sender.new
      cards = Querinator::Importer.new.parse(@path)
      cards.shuffle.each do |card|
        sender.send card.pose

        print "What was that code?\n-> "
        input = gets()
        input = input.chomp

        if  card.is_correct?(input)
          puts "Hooray!!"
        else
          puts "oooooh."
          puts "The correct answer was '#{card.answer}'"
        end
      end
    end
  end

end