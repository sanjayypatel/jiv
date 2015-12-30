class AddTitleAndNotesToItem < ActiveRecord::Migration
  def change
    add_column :items, :title, :string
    add_column :items, :notes, :text
  end
end
