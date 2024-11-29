class CreateFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.string :place_name
      t.string :place_address
      t.float :place_lat
      t.float :place_lng

      t.timestamps
    end
  end
end
