# frozen_string_literal: true

require 'faker'

FactoryBot.define do
	factory :gym do
		name { "Academia" }
		email { Faker::Internet.email }
		cnpj { "88.671.658/0001-76" }
		slug { "academia" }
		gym_type
	end
end