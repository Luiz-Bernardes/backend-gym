class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :gym

  has_many :emails
  has_many :telephones
  has_many :locations
end
