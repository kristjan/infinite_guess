require_relative '../bot'

module InfiniteGuess
  class Bot
    class LoseToRandom < Bot
      def pick
        BEATS[BEATS[OPTIONS[random.rand(3)]]]
      end
    end
  end
end
