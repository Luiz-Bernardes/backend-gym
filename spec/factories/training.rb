# frozen_string_literal: true

require 'faker'

FactoryBot.define do
	factory :training do
		name { Faker::FunnyName.name }
		record
	end
end