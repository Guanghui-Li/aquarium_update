class AddUserForeignKeyToTank < ActiveRecord::Migration[5.0]
  def change
    add_column :tanks, :user_id, :integer
    add_foreign_key :tanks, :users
  end
end