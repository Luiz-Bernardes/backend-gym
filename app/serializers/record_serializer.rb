class RecordSerializer
  include JSONAPI::Serializer
  attributes :begin_date, :end_date, :goal, :interval

  has_many :trainings, serializer: TrainingSerializer
  belongs_to :client, serializer: ClientSerializer
  belongs_to :employee, serializer: EmployeeSerializer
end
