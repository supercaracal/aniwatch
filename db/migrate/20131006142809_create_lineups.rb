class CreateLineups < ActiveRecord::Migration
  def change
    create_table :lineups do |t|
      t.string :title, null: false
      t.time :start_time, null: false
      t.references :channel, null: false, index: true, foreign_key: true
      t.references :day_of_week, null: false, index: true, foreign_key: true
      t.integer :point

      t.timestamps
    end
  end
end
