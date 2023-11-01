class EmployeeSerializer < UserSerializer
  attributes :role

  has_many :records, serializer: RecordSerializer
end
