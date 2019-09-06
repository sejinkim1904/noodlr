class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :category
      t.string :image
      t.string :restaurant_id

      t.timestamps
    end
  end
end
