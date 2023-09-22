class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: 'Team', foreign_key: 'away_team_id'
  belongs_to :league
  has_many :match_seasons
  has_many :seasons, through: :match_seasons
  has_many :mens_doubles, class_name: "IndividualMatch", foreign_key: "match_id"
  has_many :womens_doubles, class_name: "IndividualMatch", foreign_key: "match_id"
  has_many :mixed_doubles, class_name: "IndividualMatch", foreign_key: "match_id"
  has_many :mens_singles, class_name: "IndividualMatch", foreign_key: "match_id"
  has_many :womens_singles, class_name: "IndividualMatch", foreign_key: "match_id"
  
  
end
