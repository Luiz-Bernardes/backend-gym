class Gym < ApplicationRecord
	# VALIDATIONS
	validates :name, presence: true

	# ASSOCIATIONS
	has_many :emails
	has_many :telephones
	has_many :locations
	has_many :users
end
