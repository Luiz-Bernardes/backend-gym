class AddRecordIdToExercises < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :record_id, :integer
  end
end
