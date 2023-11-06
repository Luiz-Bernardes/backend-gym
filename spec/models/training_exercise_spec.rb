require 'rails_helper'

RSpec.describe TrainingExercise, type: :model do
  before(:each) do 
    @training_exercise = create(:training_exercise)
  end

  context 'Create validation' do
    it 'is expected to create object training_exercise with valid params' do
      expect(@training_exercise).to be_valid
    end
  end

  context 'Association validations' do
    it { should belong_to(:training) }
    it { should belong_to(:exercise) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :training class eq Training' do 
      expect(@training_exercise.training.class).to eq(Training)
    end
    it 'is expected to validate that :exercise class eq Exercise' do 
      expect(@training_exercise.exercise.class).to eq(Exercise)
    end
  end
  
end