class AddAccountTypeToUsers < ActiveRecord::Migration
  def change
   add_column :users, :is_firm, :boolean
  end
end
