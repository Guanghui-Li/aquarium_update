class AddUserForeignKeyToColor < ActiveRecord::Migration[5.0]
  def change
    add_column :colors, :user_id, :integer
    add_foreign_key :colors, :users
  end
end
