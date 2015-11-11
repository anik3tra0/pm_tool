class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :due_date
      t.integer :project_id
      t.boolean :is_completed, default: false

      t.timestamps null: false
    end
  end
end
