class CreateLivestocks < ActiveRecord::Migration[5.0]
  def change
    create_table :livestocks do |t|
      t.integer :stock_type_id
      t.integer :species_id
      t.string :purchase_date
      t.integer :status_id
      t.integer :color_id
      t.string :name
      t.string :image
      t.integer :tank_id
      t.integer :user_id
      t.timestamps
    end
    
    add_foreign_key :livestocks, :colors
    add_foreign_key :livestocks, :stock_types
    add_foreign_key :livestocks, :species
    add_foreign_key :livestocks, :statuses
    add_foreign_key :livestocks, :tanks
    add_foreign_key :livestocks, :users
  end
end
