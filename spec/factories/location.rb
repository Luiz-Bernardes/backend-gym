# frozen_string_literal: true

require 'faker'

FactoryBot.define do
	factory :location do
		address { Faker::Address.street_name }
		number { Faker::Address.building_number }
		neighborhood { Faker::Address.community }
		complement { Faker::Address.secondary_address }
		city
	end

	factory :location_from_gym, parent: :location do
		gym
	end

	factory :location_from_user, parent: :location do
		user
	end
end