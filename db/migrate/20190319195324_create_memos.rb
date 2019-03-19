class CreateMemos < ActiveRecord::Migration[5.0]
  def change
    create_table :memos do |t|
      t.string :description
      t.string :memo_date

      t.timestamps
    end
  end
end
