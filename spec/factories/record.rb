# frozen_string_literal: true

require 'faker'

FactoryBot.define do
	factory :record do
		begin_date { Faker::Date.backward(days: 30).to_s }
		end_date { Faker::Date.forward(days: 30).to_s }
		goal { Faker::FunnyName.name }
		interval { Faker::FunnyName.name }
		employee
		client
	end
end