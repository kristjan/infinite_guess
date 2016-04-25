require_relative '../bot'
require_relative 'native_seed'

module InfiniteGuess
  class Bot
    class NativeGround < NativeSeed
      def pick
        BEATS[BEATS[OPTIONS[random.rand(3)]]]
      end
    end
  end
end
