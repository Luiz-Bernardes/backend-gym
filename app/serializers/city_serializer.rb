class CitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :state
end