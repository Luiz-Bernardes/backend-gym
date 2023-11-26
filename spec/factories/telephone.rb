# frozen_string_literal: true

require 'faker'

FactoryBot.define do
	factory :telephone do
		number { Faker::PhoneNumber.cell_phone }
	end

	factory :telephone_from_gym, parent: :telephone do
		gym
	end

	factory :telephone_from_user, parent: :telephone do
		user
	end
end