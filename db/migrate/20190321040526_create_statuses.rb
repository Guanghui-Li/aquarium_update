class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key :statuses, :users
  end
end