module Gentone
  class Sender
  def initialize(speed = :norm)
    speeds = {fast: 0.04, norm: 0.06, slow: 0.12}
    gentone = Generate.new(speeds[speed])
    @pounder = Pounder.new(gentone)
  end

  def characters
    {
      a: %w{dit dah},
      b: %w{dah dit dit dit},
      c: %w{dah dit dah dit},
      d: %w{dah dit dit},
      e: %w{dit},
      f: %w{dit dit dah dit},
      g: %w{dah dah dit},
      h: %w{dit dit dit dit},
      i: %w{dit dit},
      j: %w{dit dah dah dah},
      k: %w{dah dit dah},
      l: %w{dit dah dit dit},
      m: %w{dah dah},
      n: %w{dah dit},
      o: %w{dah dah dah},
      p: %w{dit dah dah dit},
      q: %w{dah dah dit dah},
      r: %w{dit dah dit},
      s: %w{dit dit dit},
      t: %w{dah},
      u: %w{dit dit dah},
      v: %w{dit dit dit dah},
      w: %w{dit dah dah},
      x: %w{dah dit dit dah},
      y: %w{dah dit dah dah},
      z: %w{dah dah dit dit},
      :"1" => %w{dit dah dah dah dah},
      :"2" => %w{dit dit dah dah dah},
      :"3" => %w{dit dit dit dah dah},
      :"4" => %w{dit dit dit dit dah},
      :"5" => %w{dit dit dit dit dit},
      :"6" => %w{dah dit dit dit dit},
      :"7" => %w{dah dah dit dit dit},
      :"8" => %w{dah dah dah dit dit},
      :"9" => %w{dah dah dah dah dit},
      :"0" => %w{dah dah dah dah dah},
      :"." => %w{dit dah dit dah dit dah},
      :"," => %w{dah dah dit dit dah dah},
      :"/" => %w{dah dit dit dah dit},
      :"?" => %w{dit dit dah dah dit dit},
      :" " => %w{word_pause}
    }
  end

  def prosigns
    {
      cq: %w{dah dit dah dit dah dah dit dah},
      ar: %w{dit dah dit dah dit},
      kn: %w{dah dit dah dah dit},
      bk: %w{dah dit dit dit dah dit dah},
      sk: %w{dit dit dit dah dit dah},
      cl: %w{dah dit dah dit dit dah dit dit}
    }
  end

  def send(string)
    string.split.each do |word|
      if prosigns.keys.include? word.to_sym 
        @pounder.pound prosigns[word.to_sym]
      else
        "#{word} ".each_char do |character|
          @pounder.pound characters[character.to_sym]
        end
      end
    end
  end

end
end