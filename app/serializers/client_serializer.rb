class ClientSerializer < UserSerializer
  attributes :weight, :height, :birthdate, :begindate, :plan, :gym

  has_many :records, serializer: RecordSerializer
end
