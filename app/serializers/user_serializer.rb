class UserSerializer
  include JSONAPI::Serializer
  attributes :name

  has_many :emails, serializer: EmailSerializer
  has_many :telephones, serializer: TelephoneSerializer
  has_many :locations, serializer: LocationSerializer
end
