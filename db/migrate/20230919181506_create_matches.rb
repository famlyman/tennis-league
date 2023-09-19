class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :home_team, null: false, foreign_key: true
      t.references :away_team, null: false, foreign_key: true
      t.time :start_time
      t.references :league, null: false, foreign_key: true

      t.timestamps
    end
  end
end
