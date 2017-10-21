class Channel < ApplicationRecord
  has_many :lineups, dependent: :restrict_with_exception
end
