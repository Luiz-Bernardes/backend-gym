class GymTypeSerializer
  include JSONAPI::Serializer
  attributes :name, :slug

  has_many :gyms, serializer: GymSerializer
end
