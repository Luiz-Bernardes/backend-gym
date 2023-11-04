FactoryBot.define do
	factory :client do
		name { "Nome" }
		weight { 60.5 }
		height { 1.70}
		birthdate { "01/01/1999" }
		begindate { "01/10/2022" }
		user_type { "client" }
		gym
	end
end