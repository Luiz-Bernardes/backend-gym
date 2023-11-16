class TrainingExerciseSerializer
  include JSONAPI::Serializer
  attributes :training_id, :exercise_id

  belongs_to :training, serializer: TrainingSerializer
  belongs_to :exercise, serializer: ExerciseSerializer
end
