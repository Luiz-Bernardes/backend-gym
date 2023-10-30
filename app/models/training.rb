class Training < ApplicationRecord
	validates :name, presence: true

	belongs_to :record
end
