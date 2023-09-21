class Team < ApplicationRecord
    has_many :matches
    has_many :scores
    belongs_to :season, optional: true
    has_and_belongs_to_many :players
      
end
