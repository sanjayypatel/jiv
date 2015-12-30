class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :type
      t.date :finished

      t.timestamps null: false
    end
  end
end
