require "coreaudio"

module Gentone
  class Generate
    def initialize(dit_length)
      @dit_length = dit_length
    end

    def generate(duration, freq = 600.0)
      dev = CoreAudio.default_output_device
      buf = dev.output_buffer(1024)

      phase = Math::PI * 2.0 * 600.0 / dev.nominal_rate
      th = Thread.start do
        i = 0
        wav = NArray.sint(1024)
        loop do
          1024.times {|j| wav[j] = (0.4 * Math.sin(phase*(i+j)) * 0x7FFF).round }
          i += 1024
          buf << wav
        end
      end

      buf.start
      sleep duration
      buf.stop

      th.kill.join
    end

    def dit 
      generate(@dit_length)
    end

    def dah
      generate(3 * @dit_length)
    end

    def element_pause
      sleep @dit_length
    end

    def letter_pause
      sleep @dit_length * 3
    end

    def word_pause
      sleep @dit_length * 7
    end

  end
end