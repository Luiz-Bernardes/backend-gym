require 'faker'

FactoryBot.define do
	factory :payment_method do
		name { "Pix" }
		slug { "pix" }
	end
end