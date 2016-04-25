require_relative '../bot'

module InfiniteGuess
  class Bot
    class Nonsense < Bot
      def pick
        :ham
      end
    end
  end
end
