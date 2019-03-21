class CreateSpecies < ActiveRecord::Migration[5.0]
  def change
    create_table :species do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end
    # add_foreign_key :species, :users
  end
end
