class ChangeStatusInLivestocks < ActiveRecord::Migration[5.0]
  def change
    rename_column :livestocks, :status, :status_id
    change_column :livestocks, :status_id, :integer
    add_foreign_key :livestocks, :statuses
  end
end
