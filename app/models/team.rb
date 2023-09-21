class Team < ApplicationRecord
    has_many :matches
    has_many :scores
      
end
