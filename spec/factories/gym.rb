require 'faker'

FactoryBot.define do
	factory :gym do
		name { "Academia" }
		email { Faker::Internet.email }
		cnpj { "88.671.658/0001-76" }
		slug { "academia" }
	end
end