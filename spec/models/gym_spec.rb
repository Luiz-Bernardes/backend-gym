require 'rails_helper'

RSpec.describe Gym, type: :model do
  before(:each) do 
    @gym = create(:gym)
  end

  context 'Create validation' do
    it 'is expected to create object gym with valid params' do
      expect(@gym).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :name class eq String' do 
      expect(@gym.name.class).to eq(String)
    end
    it 'is expected to validate that :cnpj class eq String' do 
      expect(@gym.cnpj.class).to eq(String)
    end
    it 'is expected to validate that :slug class eq String' do 
      expect(@gym.slug.class).to eq(String)
    end
  end
  
end
