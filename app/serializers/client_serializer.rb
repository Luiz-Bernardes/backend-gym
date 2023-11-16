class ClientSerializer < UserSerializer
  attributes :weight, :height, :birthdate, :begindate

  has_many :records, serializer: RecordSerializer
  belongs_to :plan, serializer: PlanSerializer
  belongs_to :gym, serializer: GymSerializer
end
