require 'rails_helper'

RSpec.describe Client, type: :model do
  before(:each) do 
    @client = create(:client)
  end

  context 'Create validation' do
    it 'is expected to create object client with valid params' do
      expect(@client).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:weight) }
    it { should validate_presence_of(:height) }
  end

  context 'Association validations' do
    it { should belong_to(:gym) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :name class eq String' do 
      expect(@client.name.class).to eq(String)
    end
    it 'is expected to validate that :weight class eq BigDecimal' do 
      expect(@client.weight.class).to eq(BigDecimal)
    end
    it 'is expected to validate that :height class eq BigDecimal' do 
      expect(@client.height.class).to eq(BigDecimal)
    end
    it 'is expected to validate that :birthdate class eq String' do 
      expect(@client.birthdate.class).to eq(String)
    end
    it 'is expected to validate that :begindate class eq String' do 
      expect(@client.begindate.class).to eq(String)
    end
    it 'is expected to validate that :user_type class eq String' do 
      expect(@client.user_type.class).to eq(String)
    end
    it 'is expected to validate that :gym class eq Gym' do 
      expect(@client.gym.class).to eq(Gym)
    end
  end
  
end