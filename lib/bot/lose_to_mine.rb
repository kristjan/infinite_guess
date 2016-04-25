require_relative '../bot'

module InfiniteGuess
  class Bot
    class LoseToMine < Bot
      def pick
        history.last ? BEATS[BEATS[history.last.mine]] : OPTIONS[random.rand(3)]
      end
    end
  end
end
