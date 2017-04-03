class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.references :list, index: true
      
      t.timestamps(null: false)
    end
  end
end
