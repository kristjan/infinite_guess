require_relative '../bot'

module InfiniteGuess
  class Bot
    class CopyMine < Bot
      def pick
        history.last ? history.last.mine : OPTIONS[random.rand(3)]
      end
    end
  end
end
