require_relative '../bot'

module InfiniteGuess
  class Bot
    class BeatMine < Bot
      def pick
        history.last ? BEATS[history.last.mine] : OPTIONS[random.rand(3)]
      end
    end
  end
end
