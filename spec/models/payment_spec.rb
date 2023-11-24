require 'rails_helper'
include ApplicationHelper

RSpec.describe Payment, type: :model do
  before(:each) do 
    # FACTORIES
    @payment = create(:payment)
    @admin = create(:admin)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  context 'Create validation' do
    it 'is expected to create object payment with valid params' do
      expect(@payment).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:due_date) }
  end

  context 'Association validations' do
    it { should belong_to(:client) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :value class eq BigDecimal' do 
      expect(@payment.value.class).to eq(BigDecimal)
    end
    it 'is expected to validate that :amount_paid class eq BigDecimal' do 
      expect(@payment.amount_paid.class).to eq(BigDecimal)
    end
    it 'is expected to validate that :payment_date class eq Date' do 
      expect(@payment.payment_date.class).to eq(Date)
    end
    it 'is expected to validate that :due_date class eq Date' do 
      expect(@payment.due_date.class).to eq(Date)
    end
    it 'is expected to validate that :payment_method class eq PaymentMethod' do 
      expect(@payment.payment_method.class).to eq(PaymentMethod)
    end
    it 'is expected to validate that :client class eq Client' do 
      expect(@payment.client.class).to eq(Client)
    end
  end
  
end
