class ChangeColumnTypeToStockTypeFromLivestocks < ActiveRecord::Migration[5.0]
  def change
    rename_column :livestocks, :type, :stock_type
  end
end
