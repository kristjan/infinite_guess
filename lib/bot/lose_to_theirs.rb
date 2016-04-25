require_relative '../bot'

module InfiniteGuess
  class Bot
    class LoseToTheirs < Bot
      def pick
        history.last ? BEATS[BEATS[history.last.theirs]] : OPTIONS[random.rand(3)]
      end
    end
  end
end
