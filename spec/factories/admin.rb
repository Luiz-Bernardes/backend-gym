require 'faker'

FactoryBot.define do
	factory :admin do
		name { Faker::Name.name }
		user_type { ADMIN }
		gym
	end
end