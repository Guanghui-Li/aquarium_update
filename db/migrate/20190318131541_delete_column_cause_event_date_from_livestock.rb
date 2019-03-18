class DeleteColumnCauseEventDateFromLivestock < ActiveRecord::Migration[5.0]
  def change
    remove_column :livestocks, :cause
    remove_column :livestocks, :event_date
  end
end
