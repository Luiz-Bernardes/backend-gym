class Payment < ApplicationRecord
	# VALIDATIONS
	validates :value, :due_date , presence: true

	# ASSOCIATIONS
	belongs_to :client 
	belongs_to :payment_method, optional: true 
end
