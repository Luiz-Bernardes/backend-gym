class TelephoneSerializer
  include FastJsonapi::ObjectSerializer
  attributes :number, :gym_id, :user_id
end
