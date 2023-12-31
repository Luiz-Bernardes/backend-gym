# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe Admin, type: :model do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @admin = create(:admin, gym: @gym)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  context 'Create validation' do
    it 'is expected to create object admin with valid params' do
      expect(@admin).to be_valid
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
      expect(@admin.name.class).to eq(String)
    end
    it 'is expected to validate that :email class eq String' do 
      expect(@admin.email.class).to eq(String)
    end
    it 'is expected to validate that :gender class eq String' do 
      expect(@admin.gender.class).to eq(String)
    end
    it 'is expected to validate that :gym class eq Gym' do 
      expect(@admin.gym.class).to eq(Gym)
    end
  end
  
end