require_relative '../bot'

module InfiniteGuess
  class Bot
    class Meta < Bot

      def throw
        best = bots.values.max
        bots.each { |bot, score| bot.last_throw = bot.pick }
        self.last_throw = bots.select do |bot, score|
          score == best
        end.keys.sample.last_throw.tap { |thrown| history.mine(thrown) }
      end

      private

      attr_reader :bots

      def match_finished(match)
        bots.each do |bot, score|
          case result(bot.last_throw, match.theirs)
          when :win  then bots[bot] += 1
          when :lose then bots[bot] -= 1
          end
          debug "=== #{bot.name} #{bot.last_throw} vs #{match.theirs} -> #{score}"
        end
      end

      def post_initialize
        @bots = {
          Bot::Random.new(history) => 0,
          Bot::NativeSeed.new(history) => 1
        }
      end

      def post_reset(seed)
        bots.keys.each { |bot| bot.reset!(seed) }
      end
    end
  end
end
