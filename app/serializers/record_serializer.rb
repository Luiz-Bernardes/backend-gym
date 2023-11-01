class RecordSerializer
  include FastJsonapi::ObjectSerializer
  attributes :begin_date, :end_date, :goal, :interval, :client_id, :employee_id

  # has_many :trainings
end
