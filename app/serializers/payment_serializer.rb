class PaymentSerializer
  include JSONAPI::Serializer
  attributes :value, :amount_paid, :payment_date, :due_date

  belongs_to :payment_method, serializer: PaymentSerializer
  belongs_to :client, serializer: ClientSerializer
end
