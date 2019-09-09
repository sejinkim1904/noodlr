class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :yelp_id
      t.decimal :rating
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone

      t.timestamps
    end
  end
end
