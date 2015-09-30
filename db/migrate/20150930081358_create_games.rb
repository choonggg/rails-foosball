class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :ended
      t.references :match, index: true, foreign_key: true
      t.inreger :home_score
      t.integer :away_score

      t.timestamps null: false
    end
  end
end
