class ChangeStringToIntegerForColorIdInLivestocks < ActiveRecord::Migration[5.0]
  def change
      change_column :livestocks, :color_id, :integer
  end
end
