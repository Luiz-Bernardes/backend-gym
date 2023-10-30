class Telephone < ApplicationRecord
	validates :number, presence: true

	belongs_to :gym, optional: true 
	belongs_to :user, optional: true 
end
