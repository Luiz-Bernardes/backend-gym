class TrainingSerializer
  include JSONAPI::Serializer
  attributes :name

  has_many :exercises, serializer: ExerciseSerializer
  belongs_to :record, serializer: RecordSerializer
end
