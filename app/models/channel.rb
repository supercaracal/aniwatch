class Channel < ActiveRecord::Base
  has_many :lineups
  extend Hashable
end
