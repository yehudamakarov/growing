class AddDaytasks < ActiveRecord::Migration
  def change
    create_table :day_tasks do |t|
      t.integer :day_id
      t.integer :task_id
    end
  end
end
