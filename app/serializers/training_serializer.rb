class TrainingSerializer
  include JSONAPI::Serializer
  attributes :name, :record

  has_many :exercises, serializer: ExerciseSerializer
end
