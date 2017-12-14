class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :effect
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
