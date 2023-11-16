class TelephoneSerializer
  include JSONAPI::Serializer
  attributes :number

  belongs_to :gym, serializer: GymSerializer
  belongs_to :user, serializer: UserSerializer
end
