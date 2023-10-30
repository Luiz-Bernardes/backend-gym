class EmailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :address, :gym_id, :user_id
end
