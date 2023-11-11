class GymSerializer
  include JSONAPI::Serializer
  attributes :name, :cnpj, :owner

  has_many :emails, serializer: EmailSerializer
  has_many :telephones, serializer: TelephoneSerializer
  has_many :locations, serializer: LocationSerializer
  has_many :users, serializer: UserSerializer
end
