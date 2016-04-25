require_relative '../bot'

module InfiniteGuess
  class Bot
    class BeatWinner < Bot
      def pick
        history.last ? BEATS[history.last.winner] : OPTIONS[random.rand(3)]
      end
    end
  end
end
