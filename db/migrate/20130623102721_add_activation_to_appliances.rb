class AddActivationToAppliances < ActiveRecord::Migration
  def change
    add_column :appliances, :activation, :boolean
  end
end
