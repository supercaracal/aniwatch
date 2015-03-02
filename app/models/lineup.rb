class Lineup < ActiveRecord::Base
  belongs_to :channel
  belongs_to :day_of_week

  DAY_OF_WEEK_CODES = %i(mon tue wed thu fri sat sun).freeze

  def self.all_to_hash(day_of_weeks)
    all.each_with_object(create_empty_slots) do |item, memo|
      day_of_week_code = day_of_weeks[item.day_of_week_id].code.to_sym
      slot_sym = convert_time_to_slot(convert_time_to_minute(item.start_time))
      memo[day_of_week_code][slot_sym].push(item)
    end
  end

  def self.create_empty_slots
    DAY_OF_WEEK_CODES.each_with_object({}) do |item, memo|
      memo[item] = { midnight: [], daytime: [], sunset: [], night: [] }
    end
  end

  def self.convert_time_to_minute(time)
    time.strftime('%H').to_i * 60 + time.strftime('%M').to_i
  end

  def self.convert_time_to_slot(minute)
    if 0 <= minute && minute < 60 * 4
      :midnight
    elsif 60 * 4 <= minute && minute < 60 * 16
      :daytime
    elsif 60 * 16 <= minute && minute < 60 * 19
      :sunset
    elsif 60 * 19 <= minute && minute < 60 * 24
      :night
    else
      :unknown
    end
  end
end
