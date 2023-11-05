require 'rails_helper'

RSpec.describe Plan, type: :model do
  before(:each) do 
    @plan = create(:plan)
  end

  context 'Create validation' do
    it 'is expected to create object plan with valid params' do
      expect(@plan).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :name class eq String' do 
      expect(@plan.name.class).to eq(String)
    end
    it 'is expected to validate that :price class eq BigDecimal' do 
      expect(@plan.price.class).to eq(BigDecimal)
    end
    it 'is expected to validate that :gym class eq BigDecimal' do 
      expect(@plan.gym.class).to eq(Gym)
    end
  end
  
end