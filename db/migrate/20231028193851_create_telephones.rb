class CreateTelephones < ActiveRecord::Migration[7.1]
  def change
    create_table :telephones do |t|
      t.string :number
      t.integer :gym_id
      t.integer :user_id

      t.timestamps
    end
  end
end
