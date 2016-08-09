class Lineup < ApplicationRecord
  belongs_to :channel
  belongs_to :day_of_week
end
