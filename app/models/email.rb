class Email < ApplicationRecord
	validates :address, presence: true

	belongs_to :gym, optional: true 
	belongs_to :user, optional: true 
end
