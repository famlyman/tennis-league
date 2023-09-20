class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: 'Team', foreign_key: 'away_team_id'
  belongs_to :league
  has_and_belongs_to_many :seasons, join_table: "matches_seasons", foreign_key: "seasons_id", dependent: :destroy
end
