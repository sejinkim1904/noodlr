class CreateGoogles < ActiveRecord::Migration[5.2]
  def change
    create_table :googles do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
