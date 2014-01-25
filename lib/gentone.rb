require_relative "gentone/version"
require "coreaudio"
require "querinator"
require_relative "gentone/generate"

module Gentone
  class Runner
    def initialize
      @generator = Generator.new
    end

    def run(duration, freq)    
      @generator.generate(duration, freq)
    end
  end

end