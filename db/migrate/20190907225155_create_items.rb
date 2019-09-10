class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2
      t.string :category
      t.string :image
      t.string :status
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
