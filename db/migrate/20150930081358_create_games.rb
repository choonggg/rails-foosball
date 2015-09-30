class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :ended, default: false
      t.references :match, index: true, foreign_key: true
      t.integer :home_score, default: 0
      t.integer :away_score, default: 0

      t.timestamps null: false
    end
  end
end
