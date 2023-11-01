class State < ApplicationRecord
	# VALIDATIONS
	validates :name, :uf, presence: true

	# ASSOCIATIONS
	has_many :cities
end
