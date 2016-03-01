class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def welcome
    @day_of_weeks = DayOfWeek.all_to_hash
    @channels = Channel.all_to_hash
    @lineups = Lineup.all_to_hash(@day_of_weeks)
  end
end
