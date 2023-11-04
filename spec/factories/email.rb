FactoryBot.define do
	factory :email do
		address { "email@mail.com" }
	end

	factory :email_from_gym, parent: :email do
		gym
	end

	# factory :email_from_user, parent: :email do
	# 	user
	# end
end