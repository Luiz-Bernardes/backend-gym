class PlanSerializer
  include JSONAPI::Serializer
  attributes :name, :price

  has_many :clients, serializer: ClientSerializer
end
