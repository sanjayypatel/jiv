class AddCreatorToItems < ActiveRecord::Migration
  def change
    add_column :items, :creator, :string
    add_column :items, :creator_link, :string
  end
end
