class State < ApplicationRecord
	validates :name, :uf, presence: true

	has_many :cities
end
