class HomeController < ApplicationController
  def index
    @day_of_weeks = DayOfWeek.all.reduce do |x, y|
      x = {x.id => x} unless x.class.to_s == 'Hash'
      x[y.id] = y
      x
    end
    @channels = Channel.all.reduce do |x, y|
      x = {x.id => x} unless x.class.to_s == 'Hash'
      x[y.id] = y
      x
    end
    @lineups = Lineup.all.reduce do |x, y|
      if x.class.to_s != 'Hash'
        r = [:mon, :tue, :wed, :thu, :fri, :sat, :sun].reduce do |x, y|
          x = {x => {:midnight => [], :daytime => [], :sunset => [], :night => []}} unless x.class.to_s == 'Hash'
          x[y] = {:midnight => [], :daytime => [], :sunset => [], :night => []}
          x
        end
        day_of_week_code = @day_of_weeks[x.day_of_week_id].code.to_sym
        slotSym = convert_time_to_slot(convert_time_to_minute(x.start_time))
        r[day_of_week_code][slotSym].push(x)
        x = r
      end
      day_of_week_code = @day_of_weeks[y.day_of_week_id].code.to_sym
      slotSym = convert_time_to_slot(convert_time_to_minute(y.start_time))
      x[day_of_week_code][slotSym].push(y)
      x
    end
  end

  private

  def convert_time_to_minute(time)
    time.strftime('%H').to_i * 60 + time.strftime('%M').to_i
  end

  def convert_time_to_slot(minute)
    if 0 <= minute and minute < 60 * 4
      :midnight
    elsif 60 * 4 <= minute and minute < 60 * 16
      :daytime
    elsif 60 * 16 <= minute and minute < 60 * 19
      :sunset
    elsif 60 * 19 <= minute and minute < 60 * 24
      :night
    else
      :unknown
    end
  end
end
