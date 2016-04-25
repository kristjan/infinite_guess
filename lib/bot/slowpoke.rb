require_relative '../bot'

module InfiniteGuess
  class Bot
    class Slowpoke < Bot
      def pick
        sleep 0.02
        :rock
      end
    end
  end
end
