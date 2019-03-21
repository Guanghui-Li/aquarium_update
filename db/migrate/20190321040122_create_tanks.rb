class CreateTanks < ActiveRecord::Migration[5.0]
  def change
    create_table :tanks do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key :tanks, :users
  end
end