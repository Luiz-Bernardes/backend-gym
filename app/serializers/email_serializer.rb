class EmailSerializer
  include JSONAPI::Serializer
  attributes :address, :gym, :user
end
