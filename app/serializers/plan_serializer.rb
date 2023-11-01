class PlanSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :price

  has_many :users, serializer: UserSerializer
end
