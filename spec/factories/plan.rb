# frozen_string_literal: true

require 'faker'

FactoryBot.define do
	factory :plan do
		name { Faker::FunnyName.name  }
		price { Faker::Number.between(from: 80, to: 150).to_f }
		gym
	end
end