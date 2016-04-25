require_relative '../bot'

module InfiniteGuess
  class Bot
    class BeatRandom < Bot
      def pick
        BEATS[OPTIONS[random.rand(3)]]
      end
    end
  end
end
