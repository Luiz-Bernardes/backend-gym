class GymSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :cnpj, :owner, 
  :count_clients, :count_employees, :count_admins,
  :gym_type

  has_many :telephones, serializer: TelephoneSerializer
  has_many :locations, serializer: LocationSerializer
  has_many :users, serializer: UserSerializer
end
