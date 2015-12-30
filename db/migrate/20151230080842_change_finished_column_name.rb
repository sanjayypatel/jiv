class ChangeFinishedColumnName < ActiveRecord::Migration
  def change
    rename_column :items, :finished, :finished_on
  end
end
