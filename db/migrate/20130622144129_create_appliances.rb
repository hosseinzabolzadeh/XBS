class CreateAppliances < ActiveRecord::Migration
  def change
    create_table :appliances do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.string :icon

      t.timestamps
    end
    add_index :appliances, [:user_id, :created_at]
  end
end
