class State < ApplicationRecord
	# VALIDATIONS
	validates :name, :uf, presence: true

	# ASSOCIATIONS
	has_many :cities

	# NESTED ATTRS
	accepts_nested_attributes_for :cities
end
