require 'faker'

FactoryBot.define do
	factory :email do
		address { Faker::Internet.email }
	end

	factory :email_from_gym, parent: :email do
		gym
	end

	# factory :email_from_user, parent: :email do
	# 	user
	# end
end