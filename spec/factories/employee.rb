require 'faker'

FactoryBot.define do
	factory :employee do
		name { Faker::Name.name }
		role { Faker::Construction.role }
		user_type { EMPLOYEE }
		gym
	end
end