# frozen_string_literal: true

require 'faker'

FactoryBot.define do
	factory :app_config do
		medical_attributes { false }
		gender_attribute { true }
		gym
	end
end