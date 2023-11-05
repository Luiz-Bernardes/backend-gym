class AddGymIdToPlans < ActiveRecord::Migration[7.1]
  def change
    add_column :plans, :gym_id, :integer
  end
end
