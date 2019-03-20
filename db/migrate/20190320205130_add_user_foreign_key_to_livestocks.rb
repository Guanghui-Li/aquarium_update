class AddUserForeignKeyToLivestocks < ActiveRecord::Migration[5.0]
  def change
    add_column :livestocks, :user_id, :integer
    add_foreign_key :livestocks, :users
  end
end
