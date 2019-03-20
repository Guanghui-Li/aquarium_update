class AddUserForeignKeyToSpeciesTypesStatusMemo < ActiveRecord::Migration[5.0]
  def change
    add_column :species, :user_id, :integer
    add_foreign_key :species, :users
    
    add_column :stock_types, :user_id, :integer
    add_foreign_key :stock_types, :users
    
    add_column :statuses, :user_id, :integer
    add_foreign_key :statuses, :users
    
    add_column :memos, :user_id, :integer
    add_foreign_key :memos, :users
  end
end
