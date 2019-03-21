class CreateStockTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_types do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key :stock_types, :users
  end
end