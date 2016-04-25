require_relative '../bot'
require_relative 'native_seed'

module InfiniteGuess
  class Bot
    class NativeFarmer < NativeSeed
      def pick
        BEATS[OPTIONS[random.rand(3)]]
      end
    end
  end
end
