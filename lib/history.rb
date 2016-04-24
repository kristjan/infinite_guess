module InfiniteGuess
  class History
    Match = Struct.new(:mine, :theirs)

    def initialize
      @history = []
    end

    def last
      history.last
    end

    def mine(thrown)
      history << Match.new(thrown, nil)
    end

    def theirs(thrown)
      history.last.theirs = thrown
    end

    private

    attr_reader :current, :history
  end
end
