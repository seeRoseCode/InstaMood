class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |table|
      table.integer :user_id
      table.integer :gif_id
      t.timestamps
    end
  end
end
