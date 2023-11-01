class Training < ApplicationRecord
	# VALIDATIONS
	validates :name, presence: true

	# ASSOCIATIONS
	belongs_to :record
	has_many :training_exercises
  has_many :exercises, through: :training_exercises
end
