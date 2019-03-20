class AddTypeForeignKeyToSpecies < ActiveRecord::Migration[5.0]
  def change
    add_column :species, :stock_type_id, :integer
    add_foreign_key :species, :stock_types
  end
end
