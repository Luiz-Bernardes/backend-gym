class LocationSerializer
  include JSONAPI::Serializer
  attributes :address, :number, :neighborhood, :complement, :gym, :user, :city
end
