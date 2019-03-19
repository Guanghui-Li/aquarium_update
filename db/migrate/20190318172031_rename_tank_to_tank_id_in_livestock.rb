class RenameTankToTankIdInLivestock < ActiveRecord::Migration[5.0]
  def change
    rename_column :livestocks, :tank, :tank_id
    add_foreign_key :livestocks, :tanks
  end
end
