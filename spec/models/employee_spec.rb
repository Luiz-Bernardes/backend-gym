require 'rails_helper'

RSpec.describe Employee, type: :model do
  before(:each) do 
    @employee = create(:employee)
  end

  context 'Create validation' do
    it 'is expected to create object employee with valid params' do
      expect(@employee).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  context 'Association validations' do
    it { should belong_to(:gym) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :name class eq String' do 
      expect(@employee.name.class).to eq(String)
    end
    it 'is expected to validate that :email class eq String' do 
      expect(@employee.email.class).to eq(String)
    end
    it 'is expected to validate that :role class eq String' do 
      expect(@employee.role.class).to eq(String)
    end
    it 'is expected to validate that :gym class eq Gym' do 
      expect(@employee.gym.class).to eq(Gym)
    end
  end
  
end