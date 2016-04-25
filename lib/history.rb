module InfiniteGuess
  class History
    class Match
      attr_accessor :mine, :theirs

      def initialize(mine, theirs = nil)
        @mine, @theirs = mine, theirs
      end

      def winner
        set = [mine, theirs].uniq - Bot::FORFEIT
        return set.first if set.size < 2
        case set.sort
        when %i[paper rock]     then :paper
        when %i[rock scissors]  then :rock
        when %i[paper scissors] then :scissors
        end
      end

      def loser
        set = [mine, theirs].uniq - Bot::FORFEIT
        return set.first if set.size < 2
        case set.sort
        when %i[paper rock]     then :rock
        when %i[rock scissors]  then :scissors
        when %i[paper scissors] then :paper
        end
      end
    end

    def initialize
      @history = []
    end

    def last
      history.last
    end

    def mine(thrown)
      history << Match.new(thrown, nil)
    end

    def size
      history.size
    end

    def theirs(thrown)
      history.last.theirs = thrown
    end

    private

    attr_reader :current, :history
  end
end
