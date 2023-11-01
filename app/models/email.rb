class Email < ApplicationRecord
	# VALIDATIONS
	validates :address, presence: true

	# ASSOCIATIONS
	belongs_to :gym, optional: true 
	belongs_to :user, optional: true 
end
