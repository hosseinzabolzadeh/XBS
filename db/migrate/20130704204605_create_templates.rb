class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.string :description
      t.string :version
      t.string :image

      t.timestamps
    end
  end
end
