class ExerciseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :qnt_series, :qnt_repetitions, :record

  # has_many :trainings, serializer: TrainingSerializer
end
