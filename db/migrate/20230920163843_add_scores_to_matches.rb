class AddScoresToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :home_team_score, :integer
    add_column :matches, :away_team_score, :integer
  end
end
