class User < ApplicationRecord
	validates :name, presence: true

	has_many :emails
	belongs_to :plan, optional: true 
end
