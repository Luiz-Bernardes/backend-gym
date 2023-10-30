class CreateTrainingExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :training_exercises do |t|
      t.integer :training_id
      t.integer :exercise_id

      t.timestamps
    end
  end
end
