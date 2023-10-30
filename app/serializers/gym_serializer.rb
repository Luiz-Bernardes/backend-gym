class GymSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :cnpj

  has_many :emails
  has_many :telephones
end
