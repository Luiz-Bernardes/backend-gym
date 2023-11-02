class RecordSerializer
  include JSONAPI::Serializer
  attributes :begin_date, :end_date, :goal, :interval, :client, :employee

  has_many :trainings, serializer: TrainingSerializer
end
