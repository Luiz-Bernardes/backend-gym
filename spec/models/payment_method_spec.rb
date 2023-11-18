require 'rails_helper'

RSpec.describe PaymentMethod, type: :model do
  before(:each) do 
    @payment_method = create(:payment_method)
  end

  context 'Create validation' do
    it 'is expected to create object payment_method with valid params' do
      expect(@payment_method).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:slug) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :name class eq String' do 
      expect(@payment_method.name.class).to eq(String)
    end
    it 'is expected to validate that :slug class eq String' do 
      expect(@payment_method.slug.class).to eq(String)
    end
  end  
end
