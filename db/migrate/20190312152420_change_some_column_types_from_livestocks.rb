class ChangeSomeColumnTypesFromLivestocks < ActiveRecord::Migration[5.0]
  def change
    change_column :livestocks, :type, :integer
    change_column :livestocks, :species, :integer
    change_column :livestocks, :tank, :integer
  end
end
