require 'faker'

FactoryBot.define do
	factory :employee do
		name { Faker::Name.name }
		email { Faker::Internet.email }
		role { Faker::Construction.role }
		user_type { EMPLOYEE }
		gender { 'feminine' }
		gym
	end
end