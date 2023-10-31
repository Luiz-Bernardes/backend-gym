class Plan < ApplicationRecord
	validates :name, :price, presence: true

	has_many :users
end
