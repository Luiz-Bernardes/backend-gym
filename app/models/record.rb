class Record < ApplicationRecord
	# VALIDATIONS
	validates :begin_date, :end_date, presence: true

	# ASSOCIATIONS
	has_many :trainings
	has_many :exercises
	belongs_to :client
	belongs_to :employee, optional: true 
end
