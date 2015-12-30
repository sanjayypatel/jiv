class AddFinishedToItems < ActiveRecord::Migration
  def change
    add_column :items, :finished, :boolean
  end
end
