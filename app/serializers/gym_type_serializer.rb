class GymTypeSerializer
  include JSONAPI::Serializer
  attributes :name, :slug

  has_many :gym, serializer: GymSerializer
end
