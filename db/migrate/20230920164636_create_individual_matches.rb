class CreateIndividualMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :individual_matches do |t|
      t.string :category
      t.integer :winner
      t.integer :loser
      t.integer :sets
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
