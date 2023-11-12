require 'faker'

FactoryBot.define do
	factory :user do
		name { Faker::Name.name }
		email { Faker::Internet.email }
		gym
	end
end