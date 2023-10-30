class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :number
      t.string :neighborhood
      t.string :complement
      t.integer :gym_id
      t.integer :user_id
      t.integer :city_id

      t.timestamps
    end
  end
end
