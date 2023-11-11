require 'faker'

FactoryBot.define do
	factory :client do
		name { Faker::Name.name }
		weight { Faker::Number.between(from: 40, to: 100).to_f }
		height { Faker::Demographic.height.to_f }
		birthdate { Faker::Date.birthday(min_age: 18, max_age: 65).to_s }
		begindate { Faker::Date.backward(days: 30).to_s }
		user_type { CLIENT }
		gym
	end
end