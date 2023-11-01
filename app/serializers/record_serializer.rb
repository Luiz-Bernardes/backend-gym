class RecordSerializer
  include FastJsonapi::ObjectSerializer
  attributes :begin_date, :end_date, :goal, :interval, :client, :employee

  has_many :trainings
  has_many :exercises
end
