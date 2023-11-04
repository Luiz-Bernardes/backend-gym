require 'rails_helper'

RSpec.describe Location, type: :model do
  before(:each) do 
    @location = create(:location)
    @location_from_gym = create(:location_from_gym)
    @location_from_user = create(:location_from_user)
  end

  context 'Create validation' do
    it 'is expected to create object location with valid params' do
      expect(@location).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:neighborhood) }
  end

  context 'Association validations' do
    it { should belong_to(:city) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :address class eq String' do 
      expect(@location.address.class).to eq(String)
    end
    it 'is expected to validate that :number class eq String' do 
      expect(@location.number.class).to eq(String)
    end
    it 'is expected to validate that :neighborhood class eq String' do 
      expect(@location.neighborhood.class).to eq(String)
    end
    it 'is expected to validate that :complement class eq String' do 
      expect(@location.complement.class).to eq(String)
    end
    it 'is expected to validate that :city class eq City' do 
      expect(@location.city.class).to eq(City)
    end
    it 'is expected to validate that :gym class eq Gym' do 
      expect(@location_from_gym.gym.class).to eq(Gym)
    end
    it 'is expected to validate that :user class eq User' do 
      expect(@location_from_user.user.class).to eq(User)
    end
  end
  
end