class CitySerializer
  include JSONAPI::Serializer
  attributes :name, :state
end