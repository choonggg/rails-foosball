class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :winner_id
      t.integer :home_team_id
      t.integer :away_team_id
      t.boolean :match_over, default: false

      t.timestamps null: false
    end
  end
end
