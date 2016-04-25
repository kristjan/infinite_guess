require_relative '../bot'

module InfiniteGuess
  class Bot
    class HomegrownRandom < Bot
      def reset!(seed)
        @count = 0
        @seed = seed
      end

      def pick
        BEATS[BEATS[OPTIONS[(seed * (@count + 5) * 7) % 3]]].tap { @count += 1 }
      end

      private

      attr_reader :seed
    end
  end
end
