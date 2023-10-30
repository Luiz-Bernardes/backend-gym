class EmailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :address, :gym, :user
end
