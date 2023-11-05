require 'rails_helper'

RSpec.describe Admin, type: :model do
  before(:each) do 
    @admin = create(:admin)
  end

  context 'Create validation' do
    it 'is expected to create object admin with valid params' do
      expect(@admin).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
  end

  context 'Association validations' do
    it { should belong_to(:gym) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :name class eq String' do 
      expect(@admin.name.class).to eq(String)
    end
    it 'is expected to validate that :gym class eq Gym' do 
      expect(@admin.gym.class).to eq(Gym)
    end
  end
  
end