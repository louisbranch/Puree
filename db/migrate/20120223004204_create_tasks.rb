class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :todo
      t.integer :position
      t.timestamps
    end
    add_index :tasks, :todo_id
  end
end
