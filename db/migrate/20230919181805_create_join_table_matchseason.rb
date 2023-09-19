class CreateJoinTableMatchseason < ActiveRecord::Migration[7.0]
  def change
    create_join_table :matches, :seasons do |t|
      t.index [:match_id, :season_id]
      t.index [:season_id, :match_id]
    end
  end
end
