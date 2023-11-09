class Exercise < ApplicationRecord
	# VALIDATIONS
	validates :name, presence: true

	# ASSOCIATIONS
	has_many :training_exercises
  has_many :trainings, through: :training_exercises
  belongs_to :gym

  # NESTED ATTRS
	accepts_nested_attributes_for :trainings, :training_exercises
end
