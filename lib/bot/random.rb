require_relative '../bot'

module InfiniteGuess
  class Bot
    class Random < Bot
      def pick
        OPTIONS[random.rand(3)]
      end
    end
  end
end
