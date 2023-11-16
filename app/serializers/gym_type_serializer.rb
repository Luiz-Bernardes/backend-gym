class GymTypeSerializer
  include JSONAPI::Serializer
  attributes :name, :slug

  has_one :gym, serializer: GymSerializer
end
