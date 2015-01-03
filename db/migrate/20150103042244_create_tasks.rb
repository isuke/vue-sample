class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :assign

      t.timestamps
    end
    add_index :tasks, :title, unique: true
  end
end
