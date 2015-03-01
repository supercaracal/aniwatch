class HomeController < ApplicationController
  def index
    @day_of_weeks = DayOfWeek.all_to_hash
    @channels = Channel.all_to_hash
    @lineups = Lineup.all_to_hash(@day_of_weeks)
  end
end
