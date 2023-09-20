class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: 'Team', foreign_key: 'away_team_id'
  belongs_to :league
  has_many :match_seasons
  has_many :seasons, through: :match_seasons
  has_one :mens_doubles, class_name: "IndividualMatch", foreign_key: "match_id"
  has_one :womens_doubles, class_name: "IndividualMatch", foreign_key: "match_id"
  has_one :mixed_doubles, class_name: "IndividualMatch", foreign_key: "match_id"
  has_one :mens_singles, class_name: "IndividualMatch", foreign_key: "match_id"
  has_one :womens_singles, class_name: "IndividualMatch", foreign_key: "match_id"
  
  validates_presence_of :home_team_score, :away_team_score
end
