class ChangeNotesColumn < ActiveRecord::Migration
  def change
    rename_column :items, :notes, :blurb
  end
end
