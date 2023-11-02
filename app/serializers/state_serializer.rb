class StateSerializer
  include JSONAPI::Serializer
  attributes :name, :uf

  has_many :cities, serializer: CitySerializer
end
