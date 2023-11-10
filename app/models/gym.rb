class Gym < ApplicationRecord
	# VALIDATIONS
	validates :name, presence: true

	# ASSOCIATIONS
	has_many :emails
	has_many :telephones
	has_many :locations
	has_many :users
	has_many :plans
	has_many :exercises

	# NESTED ATTRS
	accepts_nested_attributes_for :emails, :telephones, :locations, :users, :exercises

	# METHODS
	def owner
		self.users.find_by(user_type: ADMIN)
	end
end
