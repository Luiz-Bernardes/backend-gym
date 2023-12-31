# frozen_string_literal: true

require 'faker'

FactoryBot.define do
	factory :city do
		name { Faker::Address.city }
		state
	end
end