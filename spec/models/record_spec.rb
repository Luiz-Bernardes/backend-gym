# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe Record, type: :model do
  before(:each) do 
    # FACTORIES
    @record = create(:record)
    @admin = create(:admin)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  context 'Create validation' do
    it 'is expected to create object record with valid params' do
      expect(@record).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:begin_date) }
    it { should validate_presence_of(:end_date) }
  end

  context 'Association validations' do
    it { should belong_to(:client) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :begin_date class eq String' do 
      expect(@record.begin_date.class).to eq(String)
    end
    it 'is expected to validate that :end_date class eq String' do 
      expect(@record.end_date.class).to eq(String)
    end
    it 'is expected to validate that :goal class eq String' do 
      expect(@record.goal.class).to eq(String)
    end
    it 'is expected to validate that :interval class eq String' do 
      expect(@record.interval.class).to eq(String)
    end
    it 'is expected to validate that :client class eq Client' do 
      expect(@record.client.class).to eq(Client)
    end
    it 'is expected to validate that :employee class eq Employee' do 
      expect(@record.employee.class).to eq(Employee)
    end
  end
  
end