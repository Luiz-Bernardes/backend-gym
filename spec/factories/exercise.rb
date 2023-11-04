require 'faker'

FactoryBot.define do
	factory :exercise do
		name { Faker::FunnyName.name }
		qnt_series { Faker::Number.digit }
		qnt_repetitions { Faker::Number.digit }
	end
end