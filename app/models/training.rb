class Training < ApplicationRecord
	# VALIDATIONS
	validates :name, presence: true

	# ASSOCIATIONS
	belongs_to :record
	has_many :training_exercises
  has_many :exercises, through: :training_exercises

  # NESTED ATTRS
	accepts_nested_attributes_for :exercises, :training_exercises
end
