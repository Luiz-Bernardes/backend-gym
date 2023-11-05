require 'rails_helper'

RSpec.describe Training, type: :model do
  before(:each) do 
    @training = create(:training)
  end

  context 'Create validation' do
    it 'is expected to create object training with valid params' do
      expect(@training).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
  end

  context 'Association validations' do
    it { should belong_to(:record) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :name class eq String' do 
      expect(@training.name.class).to eq(String)
    end
    it 'is expected to validate that :record class eq Record' do 
      expect(@training.record.class).to eq(Record)
    end
  end
  
end