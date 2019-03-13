class ChangeSpeciesToSpeciesId < ActiveRecord::Migration[5.0]
  def change
    rename_column :livestocks, :species, :species_id
    add_foreign_key :livestocks, :species
  end
end