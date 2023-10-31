class User < ApplicationRecord
	validates :name, presence: true

	has_many :emails
	has_many :telephones
	has_many :locations
	belongs_to :plan, optional: true 
end
