require_relative '../bot'

module InfiniteGuess
  class Bot
    class BeatTheirs < Bot
      def pick
        history.last ? BEATS[history.last.theirs] : OPTIONS[random.rand(3)]
      end
    end
  end
end
