class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.integer :livestock_id
      t.string :event
      t.string :image
      t.string :event_date
      t.integer :user_id
      t.timestamps
    end
    
    add_foreign_key :histories, :livestocks
    add_foreign_key :histories, :users
  end
end