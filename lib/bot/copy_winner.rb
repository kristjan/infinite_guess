require_relative '../bot'

module InfiniteGuess
  class Bot
    class CopyWinner < Bot
      def pick
        history.last ? history.last.winner : OPTIONS[random.rand(3)]
      end
    end
  end
end
