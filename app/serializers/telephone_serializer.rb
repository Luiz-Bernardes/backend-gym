class TelephoneSerializer
  include JSONAPI::Serializer
  attributes :number, :gym, :user
end
