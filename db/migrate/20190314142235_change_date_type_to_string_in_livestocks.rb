class ChangeDateTypeToStringInLivestocks < ActiveRecord::Migration[5.0]
  def change
    change_column :livestocks, :purchase_date, :string
    change_column :livestocks, :event_date, :string
  end
end
