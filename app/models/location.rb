class Location < ApplicationRecord
	validates :address,:number,:neighborhood , presence: true

	belongs_to :gym, optional: true 
	belongs_to :user, optional: true 
	belongs_to :city 
end
