class Exercise < ApplicationRecord
	# VALIDATIONS
	validates :name, presence: true

	# ASSOCIATIONS
	belongs_to :record
	has_many :training_exercises
  has_many :trainings, through: :training_exercises
end
