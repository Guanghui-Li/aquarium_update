class ChangeStockTypeToStockTypeId < ActiveRecord::Migration[5.0]
  def change
      rename_column :livestocks, :stock_type, :stock_type_id
      add_foreign_key :livestocks, :stock_types
  end
end
