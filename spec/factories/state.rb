# frozen_string_literal: true

require 'faker'

FactoryBot.define do
	factory :state do
		name { Faker::Address.state }
		uf { Faker::Address.state_abbr }
	end
end