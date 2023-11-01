class User < ApplicationRecord
	# VALIDATIONS
	validates :name, :gym_id, presence: true

	# ASSOCIATIONS
	has_many :emails
	has_many :telephones
	has_many :locations
	belongs_to :gym
	belongs_to :plan, optional: true 
end
