class AddArchToAppliances < ActiveRecord::Migration
  def change
   add_column :appliances, :arch, :string
  end
end
