require 'faker'

FactoryBot.define do
	factory :training_exercise do
		training
		exercise
	end
end