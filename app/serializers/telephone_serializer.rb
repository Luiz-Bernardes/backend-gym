class TelephoneSerializer
  include FastJsonapi::ObjectSerializer
  attributes :number, :gym, :user
end
