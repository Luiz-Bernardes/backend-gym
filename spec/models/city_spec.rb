# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  before(:each) do 
    @city = create(:city)
  end

  context 'Create validation' do
    it 'is expected to create object city with valid params' do
      expect(@city).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
  end

  context 'Association validations' do
    it { should belong_to(:state) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :name class eq String' do 
      expect(@city.name.class).to eq(String)
    end
    it 'is expected to validate that :state class eq State' do 
      expect(@city.state.class).to eq(State)
    end
  end
  
end