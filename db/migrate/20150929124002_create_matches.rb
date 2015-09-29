class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :winner
      t.integer :home_team
      t.integer :away_team
      t.boolean :match_over, default: false

      t.timestamps null: false
    end
  end
end
