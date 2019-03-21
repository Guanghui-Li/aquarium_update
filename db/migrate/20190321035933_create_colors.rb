class CreateColors < ActiveRecord::Migration[5.0]
  def change
    create_table :colors do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key :colors, :users
  end
end
