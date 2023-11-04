require 'faker'

FactoryBot.define do
	factory :admin do
		name { Faker::Name.name }
		gym
	end
end