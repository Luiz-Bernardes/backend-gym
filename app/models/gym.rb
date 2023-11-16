class Gym < ApplicationRecord
	# VALIDATIONS
	validates :name, :email, presence: true

	# ASSOCIATIONS
	has_many :telephones
	has_many :locations
	has_many :users
	has_many :plans
	has_many :exercises
	belongs_to :gym_type

	# NESTED ATTRS
	accepts_nested_attributes_for :telephones, :locations, :users, :exercises

	# METHODS
	def owner
		owner = GymService.find_owner(self)
		{ id: owner.id , name: owner.name } unless owner.nil?
	end

	def count_clients
		GymService.count_users(self, CLIENT)
	end

	def count_employees
		GymService.count_users(self, EMPLOYEE)
	end

	def count_admins
		GymService.count_users(self, ADMIN)
	end
end
