FactoryBot.define do
	factory :telephone do
		number { "(22)98888-7777" }
	end

	factory :telephone_from_gym, parent: :telephone do
		gym
	end

	# factory :telephone_from_user, parent: :telephone do
	# 	user
	# end
end