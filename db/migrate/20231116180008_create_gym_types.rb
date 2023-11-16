class CreateGymTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :gym_types do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
