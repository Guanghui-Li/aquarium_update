class CreateLivestocks < ActiveRecord::Migration[5.0]
  def change
    create_table :livestocks do |t|
      t.string :type
      t.string :species
      t.date :purchase_date
      t.string :status
      t.text :cause
      t.date :event_date
      t.string :color
      t.text :name
      t.string :image
      t.string :aquarium
      t.timestamps
    end
  end
end
