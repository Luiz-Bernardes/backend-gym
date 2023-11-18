class PaymentMethodSerializer
  include JSONAPI::Serializer
  attributes :name, :slug

  has_many :payments, serializer: PaymentSerializer
end
