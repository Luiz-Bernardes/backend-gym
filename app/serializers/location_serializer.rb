class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :address, :number, :neighborhood, :complement, :gym, :user, :city
end
