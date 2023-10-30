class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :address, :number, :neighborhood, :complement, :gym_id, :user_id, :city_id
end
