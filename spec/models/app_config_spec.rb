require 'rails_helper'
include ApplicationHelper

RSpec.describe AppConfig, type: :model do
  before(:each) do 
    # FACTORIES
    @app_config = create(:app_config)
    @admin = create(:admin)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  context 'Create validation' do
    it 'is expected to create object app_config with valid params' do
      expect(@app_config).to be_valid
    end
  end

  context 'Class type validations' do
    it 'is expected to validate that :medical_attributes class eq Boolean' do 
      expect(@app_config.medical_attributes.class).to eq(FalseClass)
    end
    it 'is expected to validate that :gender_attribute class eq Boolean' do 
      expect(@app_config.gender_attribute.class).to eq(TrueClass)
    end
    it 'is expected to validate that :gym class eq Gym' do 
      expect(@app_config.gym.class).to eq(Gym)
    end
  end
  
end
