require_relative '../bot'

module InfiniteGuess
  class Bot
    class CopyTheirs < Bot
      def pick
        history.last ? history.last.theirs : OPTIONS[random.rand(3)]
      end
    end
  end
end
