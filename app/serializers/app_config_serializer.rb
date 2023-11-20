class AppConfigSerializer
  include JSONAPI::Serializer
  attributes :medical_attributes, :gender_attribute

  belongs_to :gym, serializer: GymSerializer
end
