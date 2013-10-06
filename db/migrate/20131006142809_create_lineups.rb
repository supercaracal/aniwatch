class CreateLineups < ActiveRecord::Migration
  def change
    create_table :lineups do |t|
      t.string :title
      t.time :start_time
      t.integer :channel_id
      t.integer :day_of_week_id
      t.integer :point

      t.timestamps
    end
  end
end
