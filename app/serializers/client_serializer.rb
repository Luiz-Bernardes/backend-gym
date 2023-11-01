class ClientSerializer < UserSerializer
  attributes :weight, :height, :birthdate, :begindate, :plan

  has_many :records
end
