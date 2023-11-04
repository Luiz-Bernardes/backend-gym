FactoryBot.define do
	factory :location do
		address { "Rua A" }
		number { "1111" }
		neighborhood { "Centro" }
		complement { "Casa" }
		city
	end

	factory :location_from_gym, parent: :location do
		gym
	end

	# factory :location_from_user, parent: :location do
	# 	user
	# end
end