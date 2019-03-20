class AddUserForeignKeyToHistory < ActiveRecord::Migration[5.0]
  def change
    add_column :histories, :user_id, :integer
    add_foreign_key :histories, :users
  end
end
