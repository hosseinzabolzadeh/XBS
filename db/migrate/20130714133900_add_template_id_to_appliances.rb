class AddTemplateIdToAppliances < ActiveRecord::Migration
  def change
  add_column :appliances, :template_id, :integer
  end
end
