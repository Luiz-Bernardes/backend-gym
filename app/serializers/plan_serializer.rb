class PlanSerializer
  include JSONAPI::Serializer
  attributes :name, :price

  has_many :users, serializer: UserSerializer
end
