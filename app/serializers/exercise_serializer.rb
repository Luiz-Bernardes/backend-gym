class ExerciseSerializer
  include JSONAPI::Serializer
  attributes :name, :qnt_series, :qnt_repetitions, :gym

  has_many :trainings, serializer: TrainingSerializer
end
