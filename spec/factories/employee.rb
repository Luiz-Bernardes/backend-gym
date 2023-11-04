require 'faker'

FactoryBot.define do
	factory :employee do
		name { Faker::Name.name }
		role { Faker::Construction.role }
		gym
	end
end