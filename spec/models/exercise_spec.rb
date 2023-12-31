# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe Exercise, type: :model do
  before(:each) do 
    # FACTORIES
    @exercise = create(:exercise)
    @admin = create(:admin)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  context 'Create validation' do
    it 'is expected to create object exercise with valid params' do
      expect(@exercise).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :name class eq String' do 
      expect(@exercise.name.class).to eq(String)
    end
    it 'is expected to validate that :qnt_series class eq Integer' do 
      expect(@exercise.qnt_series.class).to eq(Integer)
    end
    it 'is expected to validate that :qnt_repetitions class eq Integer' do 
      expect(@exercise.qnt_repetitions.class).to eq(Integer)
    end
  end
  
end
