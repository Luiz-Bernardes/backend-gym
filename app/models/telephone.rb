class Telephone < ApplicationRecord
	# VALIDATIONS
	validates :number, presence: true

	# ASSOCIATIONS
	belongs_to :gym, optional: true 
	belongs_to :user, optional: true 
end
