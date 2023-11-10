require 'rails_helper'

RSpec.describe Gym, type: :model do
  before(:each) do 
    @gym = create(:gym)
    @admin = create(:admin, gym: @gym)
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

  context 'Methods validations' do
    context 'Service methods' do
      it '#find_by_slug_or_id' do 
        gym_by_id = GymService.find_by_slug_or_id(@gym.id)
        gym_by_slug = GymService.find_by_slug_or_id(@gym.slug)
        expect(gym_by_id.class.name).to eq("Gym")
        expect(gym_by_slug.class.name).to eq("Gym")
      end
    end

    context 'Model methods' do
      it '#owner' do
        expect(@gym.owner.name).to eq(@admin.name)
      end
    end
  end
  
end
