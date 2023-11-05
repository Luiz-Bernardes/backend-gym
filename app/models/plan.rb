class Plan < ApplicationRecord
	# VALIDATIONS
	validates :name, :price, presence: true

	# ASSOCIATIONS
	has_many :users
	belongs_to :gym, optional: true 

	# NESTED ATTRS
	accepts_nested_attributes_for :users
end
