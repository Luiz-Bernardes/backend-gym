class StateSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :uf

  has_many :cities, serializer: CitySerializer
end
