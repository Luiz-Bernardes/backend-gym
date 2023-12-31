# frozen_string_literal: true

require 'faker'

FactoryBot.define do
	factory :client do
		name { Faker::Name.name }
		email { Faker::Internet.email }
		weight { Faker::Number.between(from: 40, to: 100).to_f }
		height { Faker::Demographic.height.to_f }
		birthdate { Faker::Date.birthday(min_age: 18, max_age: 65).to_s }
		begindate { Faker::Date.backward(days: 30).to_s }
		user_type { CLIENT }
		medical_name { Faker::Name.name }
		medical_address { Faker::Address.street_name }
		medical_email { Faker::Internet.email }
		medical_telephone { Faker::PhoneNumber.cell_phone }
		medical_type { 'general' }
		gender { 'masculine' }
		plan
		gym
	end
end