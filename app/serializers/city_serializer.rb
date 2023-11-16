class CitySerializer
  include JSONAPI::Serializer
  attributes :name

  belongs_to :state, serializer: StateSerializer
end