class CreateDayOfWeeks < ActiveRecord::Migration
  def change
    create_table :day_of_weeks do |t|
      t.string :code, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
