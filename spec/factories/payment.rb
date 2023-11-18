require 'faker'

FactoryBot.define do
	factory :payment do
		value {  Faker::Number.between(from: 80, to: 150).to_f }
		amount_paid {  Faker::Number.between(from: 80, to: 150).to_f }
		payment_date { Faker::Date.between(from: '2023-11-23', to: '2023-11-25').to_s }
		due_date { Faker::Date.between(from: '2023-11-25', to: '2023-11-30').to_s }
		payment_method
		client
	end
end