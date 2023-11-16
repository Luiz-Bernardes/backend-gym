class LocationSerializer
  include JSONAPI::Serializer
  attributes :address, :number, :neighborhood, :complement

  belongs_to :gym, serializer: GymSerializer
  belongs_to :user, serializer: UserSerializer
  belongs_to :city, serializer: CitySerializer
end
