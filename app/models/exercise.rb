class Exercise < ApplicationRecord
	validates :name, presence: true

	belongs_to :record

	has_many :training_exercises
  has_many :trainings, through: :training_exercises
end
