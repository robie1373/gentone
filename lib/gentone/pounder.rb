module Gentone
  class Pounder
    def initialize(generator)
      @g = generator
    end
  
    def pound(symbol)
      symbol.each do |element|
        eval "@g." + element#.tr(",", "")
        @g.element_pause
      end
      @g.letter_pause
    end
  end
end