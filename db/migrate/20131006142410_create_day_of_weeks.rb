class CreateDayOfWeeks < ActiveRecord::Migration
  def change
    create_table :day_of_weeks do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
