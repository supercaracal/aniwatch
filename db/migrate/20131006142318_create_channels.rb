class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
