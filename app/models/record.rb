class Record < ApplicationRecord
	validates :begin_date, :end_date, presence: true

	has_many :trainings
end
