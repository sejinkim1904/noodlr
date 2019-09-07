class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :category
      t.string :image
      t.references :restaurant, foreign_key: true
    end
  end
end
