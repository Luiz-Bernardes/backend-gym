class City < ApplicationRecord
	# VALIDATIONS
	validates :name, presence: true

	# ASSOCIATIONS
	has_many :locations
	belongs_to :state
end
