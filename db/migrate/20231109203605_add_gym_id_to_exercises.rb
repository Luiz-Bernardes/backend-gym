class AddGymIdToExercises < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :gym_id, :integer
  end
end
