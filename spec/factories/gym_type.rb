# frozen_string_literal: true

require 'faker'

FactoryBot.define do
	factory :gym_type do
		name { "Musculação" }
		slug { "bodybuilding" }
	end
end