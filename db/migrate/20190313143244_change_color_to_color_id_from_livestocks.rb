class ChangeColorToColorIdFromLivestocks < ActiveRecord::Migration[5.0]
  def change
      rename_column :livestocks, :color, :color_id
  end
end
