class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :item, index: true, foreign_key: true
      t.references :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
