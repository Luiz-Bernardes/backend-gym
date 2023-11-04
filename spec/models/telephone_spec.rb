require 'rails_helper'

RSpec.describe Telephone, type: :model do
  before(:each) do 
    @telephone = create(:telephone)
    @telephone_from_gym = create(:telephone_from_gym)
    # @telephone_from_user = create(:telephone_from_user)
  end

  context 'Create validation' do
    it 'is expected to create object telephone with valid params' do
      expect(@telephone).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:number) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :number class eq String' do 
      expect(@telephone.number.class).to eq(String)
    end
    it 'is expected to validate that :gym class eq Gym' do 
      expect(@telephone_from_gym.gym.class).to eq(Gym)
    end
    # it 'is expected to validate that :user class eq User' do 
    #   expect(@telephone_from_user.user.class).to eq(User)
    # end
  end
  
end
