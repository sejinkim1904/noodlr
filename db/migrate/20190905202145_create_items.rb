class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :type
      t.string :image
      t.string :restaurant
    end
  end
end
