class AddBlurbToList < ActiveRecord::Migration
  def change
    add_column :lists, :blurb, :text
  end
end
