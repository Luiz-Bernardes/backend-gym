class Gym < ApplicationRecord
	validates :name, presence: true

	has_many :emails
	has_many :telephones
	has_many :locations
	has_many :users
end
