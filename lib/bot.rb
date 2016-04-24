module InfiniteGuess
  class Bot
    attr_accessor :name, :random

    @@instance_count = 0

    def initialize
      reset!(::Random.new_seed)
      @name = "InfiniteGuess.#{@@instance_count}"
      @@instance_count += 1
    end

    def reset!(seed)
      @random = ::Random.new(seed * 2 ** 128)
    end

    def throw
      raise NotImplementedError
    end

    def last_competitor_throw=(thrown)
    end
  end
end

Dir[File.join(File.dirname(__FILE__), 'bot', '*')].each { |bot| require bot }
