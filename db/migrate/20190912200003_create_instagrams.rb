class CreateInstagrams < ActiveRecord::Migration[5.2]
  def change
    create_table :instagrams do |t|
      t.references :user, foreign_key: true
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps
    end
  end
end
