class Training < ApplicationRecord
	validates :name, presence: true

	belongs_to :record

	has_many :training_exercises
  has_many :exercises, through: :training_exercises
end
