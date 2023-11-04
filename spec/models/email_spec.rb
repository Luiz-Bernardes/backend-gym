require 'rails_helper'

RSpec.describe Email, type: :model do
  before(:each) do 
    @email = create(:email)
    @email_from_gym = create(:email_from_gym)
    @email_from_user = create(:email_from_user)
  end

  context 'Create validation' do
    it 'is expected to create object email with valid params' do
      expect(@email).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:address) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :address class eq String' do 
      expect(@email.address.class).to eq(String)
    end
    it 'is expected to validate that :gym class eq Gym' do 
      expect(@email_from_gym.gym.class).to eq(Gym)
    end
    it 'is expected to validate that :user class eq User' do 
      expect(@email_from_user.user.class).to eq(User)
    end
  end
  
end
