module InfiniteGuess
  class Bot
    attr_accessor :name, :random

    @@instance_count = 0

    def initialize(history = History.new)
      @history = history
      @name = "#{self.class.name}.#{@@instance_count}"
      @@instance_count += 1
      post_initialize
      reset!(::Random.new_seed)
    end

    def reset!(seed)
      @random = ::Random.new(seed * 2 ** 128)
      post_reset(seed)
    end

    def throw
      pick.tap do |thrown|
        self.last_throw = thrown
        history.mine(thrown)
      end
    end

    def last_competitor_throw=(thrown)
      if OPTIONS.include?(thrown)
        history.theirs(thrown)
        match_finished(history.last)
      else
        history.pop # Don't remember invalid matches
      end
    end

    protected

    attr_accessor :last_throw

    def pick
      raise NotImplementedError
    end


    private

    attr_reader :history

    def debug(*args)
      puts(*args) if ENV['DEBUG']
    end

    def match_finished(match)
    end

    def post_initialize
    end

    def post_reset(seed)
    end

    BEATS = {
      rock:     :paper,
      paper:    :scissors,
      scissors: :rock
    }
    FORFEIT = %i[invalid timeout]
    def result(mine, theirs)
      case
      when FORFEIT.include?(theirs),
           BEATS[theirs] == mine
        :win
      when mine == theirs
        :tie
      else
        :lose
      end
    end
  end
end

Dir[File.join(File.dirname(__FILE__), 'bot', '*')].each { |bot| require bot }
