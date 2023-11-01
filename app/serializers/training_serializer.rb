class TrainingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :record

  # has_many :training_exercises
end
