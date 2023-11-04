require 'faker'

FactoryBot.define do
	factory :user do
		name { Faker::Name.name }
		gym
	end
end