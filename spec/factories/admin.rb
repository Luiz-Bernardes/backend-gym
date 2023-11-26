# frozen_string_literal: true

require 'faker'

FactoryBot.define do
	factory :admin do
		name { Faker::Name.name }
		email { Faker::Internet.email }
		user_type { ADMIN }
		gender { 'masculine' }
		gym
	end
end