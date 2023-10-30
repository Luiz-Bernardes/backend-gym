class City < ApplicationRecord
	validates :name, presence: true

	has_many :locations
	belongs_to :state
end
