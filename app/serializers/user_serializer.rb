class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :gender

  has_many :telephones, serializer: TelephoneSerializer
  has_many :locations, serializer: LocationSerializer
end
