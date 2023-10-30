class CitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :state_id
end