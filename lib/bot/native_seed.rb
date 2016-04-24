require_relative '../bot'

module InfiniteGuess
  class Bot
    class NativeSeed < Bot
      def reset!(seed)
        @random = ::Random.new(seed)
      end

      def pick
        OPTIONS[random.rand(3)]
      end
    end
  end
end
