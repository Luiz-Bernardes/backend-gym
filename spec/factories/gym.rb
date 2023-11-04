require 'faker'

FactoryBot.define do
	factory :gym do
		name { "Academia" }
		cnpj { "88.671.658/0001-76" }
		slug { "academia" }
	end
end