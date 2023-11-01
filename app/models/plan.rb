class Plan < ApplicationRecord
	# VALIDATIONS
	validates :name, :price, presence: true

	# ASSOCIATIONS
	has_many :users
end
