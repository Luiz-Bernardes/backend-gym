class Location < ApplicationRecord
	# VALIDATIONS
	validates :address,:number,:neighborhood , presence: true

	# ASSOCIATIONS
	belongs_to :gym, optional: true 
	belongs_to :user, optional: true 
	belongs_to :city 
end
