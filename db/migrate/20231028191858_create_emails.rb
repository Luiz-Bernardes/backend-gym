class CreateEmails < ActiveRecord::Migration[7.1]
  def change
    create_table :emails do |t|
      t.string :address
      t.integer :gym_id
      t.integer :user_id

      t.timestamps
    end
  end
end
