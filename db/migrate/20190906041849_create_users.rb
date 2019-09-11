class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :role, default: 0
      t.integer :auth_type, default: 0
      t.string :registered
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
