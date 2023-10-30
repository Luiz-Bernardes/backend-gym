class Gym < ApplicationRecord
	validates :name, presence: true

	has_many :emails
	has_many :telephones
end
