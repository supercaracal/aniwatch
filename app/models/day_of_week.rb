class DayOfWeek < ApplicationRecord
  has_many :lineups

  class Slot
    class SlotTime
      def initialize(time)
        @minute = time.strftime('%H').to_i * 60 + time.strftime('%M').to_i
      end

      def midnight?
        0 <= @minute && @minute < 60 * 5
      end

      def daytime?
        60 * 5 <= @minute && @minute < 60 * 16
      end

      def sunset?
        60 * 16 <= @minute && @minute < 60 * 19
      end

      def night?
        60 * 19 <= @minute && @minute < 60 * 24
      end
    end

    attr_accessor :midnight, :daytime, :sunset, :night

    def initialize
      @midnight = []
      @daytime = []
      @sunset = []
      @night = []
    end

    def add(lineup)
      slot_time = SlotTime.new(lineup.start_time)
      if slot_time.midnight?
        @midnight << lineup
      elsif slot_time.daytime?
        @daytime << lineup
      elsif slot_time.sunset?
        @sunset << lineup
      elsif slot_time.night?
        @night << lineup
      end
    end
  end

  def build_slot
    slot = Slot.new
    lineups.each { |lineup| slot.add(lineup) }
    slot
  end
end
