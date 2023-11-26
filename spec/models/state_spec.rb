# frozen_string_literal: true

require 'rails_helper'

RSpec.describe State, type: :model do
  before(:each) do 
    @state = create(:state)
  end

  context 'Create validation' do
    it 'is expected to create object state with valid params' do
      expect(@state).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:uf) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :name class eq String' do 
      expect(@state.name.class).to eq(String)
    end
    it 'is expected to validate that :uf class eq String' do 
      expect(@state.uf.class).to eq(String)
    end
  end
  
end
