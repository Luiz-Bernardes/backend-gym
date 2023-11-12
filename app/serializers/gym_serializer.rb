class GymSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :cnpj, :owner

  has_many :telephones, serializer: TelephoneSerializer
  has_many :locations, serializer: LocationSerializer
  has_many :users, serializer: UserSerializer
end
