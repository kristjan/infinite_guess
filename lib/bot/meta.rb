require_relative '../bot'
Dir[File.join(File.dirname(__FILE__), '*')].each { |bot| require bot }

module InfiniteGuess
  class Bot
    class Meta < Bot

      def throw
        best = bots.values.max
        bots.each { |bot, score| bot.last_throw = bot.pick }
        front_runners = bots.select do |bot, score|
          score == best
        end.keys
        champion = front_runners[random.rand(front_runners.size)]
        debug "- Throw by #{champion.name}"
        self.last_throw = champion.last_throw.tap { |thrown| history.mine(thrown) }
      end

      private

      attr_reader :bots

      def match_finished(match)
        bots.each do |bot, score|
          case result(bot.last_throw, match.theirs)
          when :win  then bots[bot] += 1
          when :lose then bots[bot] -= 1
          end
          #debug "=== #{bot.name} #{bot.last_throw} vs #{match.theirs} -> #{score}"
        end
      end

      SUB_BOTS = [
        CopyMine,
        BeatMine,
        LoseToMine,
        CopyTheirs,
        BeatTheirs,
        LoseToTheirs,
        CopyWinner,
        BeatWinner,
        LoseToWinner,
        Bot::Random,
        BeatRandom,
        LoseToRandom,
        NativeFarmer,
        NativeGround,
        HomegrownRandom,
        BeatHomegrownRandom,
        LoseToHomegrownRandom
      ]
      def post_initialize
        @bots = Hash[SUB_BOTS.map { |bot| [bot.new(history), 0] }]
        @bots[NativeSeed.new(history)] = 1
      end

      def post_reset(seed)
        bots.keys.each { |bot| bot.reset!(seed) }
      end
    end
  end
end
