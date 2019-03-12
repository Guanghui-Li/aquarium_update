class ChangeAquariumToTankFromLivestocks < ActiveRecord::Migration[5.0]
  def change
    rename_column :livestocks, :aquarium, :tank
  end
end
