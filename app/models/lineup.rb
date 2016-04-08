class Lineup < ActiveRecord::Base
  belongs_to :channel
  belongs_to :day_of_week
end
