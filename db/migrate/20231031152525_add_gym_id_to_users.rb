class AddGymIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :gym_id, :integer
  end
end
