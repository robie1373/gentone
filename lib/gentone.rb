require_relative "gentone/version"
require "coreaudio"
require "querinator"
require_relative "gentone/generate"
require_relative "gentone/pounder"
require_relative "gentone/sender"

module Gentone
  class Runner
    def initialize
      @path = File.absolute_path(File.join(File.dirname(__FILE__), "..", "spec", "practice_cards.json"))
    end

    def run
      sender = Sender.new
      cards = Querinator::Importer.new.parse(@path)
      while 1
        random_card = cards.sample
        sender.send random_card.pose

        print "What was that code?\n-> "
        input = gets()
        input = input.chomp

        if  random_card.is_correct?(input)
          puts "Hooray!!"
        else
          puts "oooooh."
          puts "The correct answer was '#{random_card.answer}'"
        end
      end
    end
  end
  # test = "cq cq jt6/kv4qp"# calling cq. hello world kn k9tt"
  # Sender.new.send test
  Runner.new.run
end