class PaymentMethod < ApplicationRecord
	# VALIDATIONS
	validates :name, :slug , presence: true

	# ASSOCIATIONS
	has_many :payments 
end
