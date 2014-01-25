require "coreaudio"

module Gentone
  class Generator

    def generate(duration, freq = 600.0)
      sec_duration = duration / 1_000.0
      frequency = freq * 1.0

      dev = CoreAudio.default_output_device
      buf = dev.output_buffer(1024)

      phase = Math::PI * 2.0 * frequency / dev.nominal_rate
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
      sleep sec_duration
      buf.stop

      th.kill.join
    end


  end
end