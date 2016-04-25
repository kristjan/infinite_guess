require_relative '../bot'

module InfiniteGuess
  class Bot
    class LoseToWinner < Bot
      def pick
        history.last ? BEATS[BEATS[history.last.winner]] : OPTIONS[random.rand(3)]
      end
    end
  end
end
