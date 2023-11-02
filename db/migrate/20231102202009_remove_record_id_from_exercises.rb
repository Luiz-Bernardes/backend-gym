class RemoveRecordIdFromExercises < ActiveRecord::Migration[7.1]
  def change
    remove_column :exercises , :record_id
  end
end
