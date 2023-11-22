class Plan < ApplicationRecord
	# VALIDATIONS
	validates :name, :price, presence: true

	# ASSOCIATIONS
	has_many :clients
	belongs_to :gym, optional: true 

	# NESTED ATTRS
	accepts_nested_attributes_for :clients
end
