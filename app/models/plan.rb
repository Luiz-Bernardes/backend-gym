class Plan < ApplicationRecord
	# VALIDATIONS
	validates :name, :price, presence: true

	# ASSOCIATIONS
	has_many :users

	# NESTED ATTRS
	accepts_nested_attributes_for :users
end
