class CreateMemos < ActiveRecord::Migration[5.0]
  def change
    create_table :memos do |t|
      t.string :description
      t.string :memo_date
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key :memos, :users
  end
end