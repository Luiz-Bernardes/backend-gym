class GymType < ApplicationRecord
	# VALIDATIONS
	validates :name, :slug, presence: true	

	# ASSOCIATIONS
	has_one :gym
end
