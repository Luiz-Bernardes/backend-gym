class TrainingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :record

  # has_many :exercises
end