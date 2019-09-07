class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :latitude
      t.string :longitude
      t.integer :price

      t.timestamps
    end
  end
end
