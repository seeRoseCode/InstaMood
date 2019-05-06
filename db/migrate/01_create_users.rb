class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      table.string :name
      table.integer :mood_id
    end
  end
end
