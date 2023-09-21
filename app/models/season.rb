class Season < ApplicationRecord
  has_many :match_seasons 
  has_many :matches, through: :match_seasons
  has_many :scores

end
