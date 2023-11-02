class City < ApplicationRecord
	# VALIDATIONS
	validates :name, presence: true

	# ASSOCIATIONS
	has_many :locations
	belongs_to :state

	# NESTED ATTRS
	accepts_nested_attributes_for :locations
end
