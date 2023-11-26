# frozen_string_literal: true

require 'rails_helper'
require 'faker'
include ApplicationHelper

RSpec.describe Client, type: :model do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @client = create(:client, gym: @gym)
    @admin = create(:admin, gym: @gym)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  context 'Create validation' do
    it 'is expected to create object client with valid params' do
      expect(@client).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
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
    it 'is expected to validate that :email class eq String' do 
      expect(@client.email.class).to eq(String)
    end
    it 'is expected to validate that :weight class eq BigDecimal' do 
      expect(@client.weight.class).to eq(BigDecimal)
    end
    it 'is expected to validate that :height class eq BigDecimal' do 
      expect(@client.height.class).to eq(BigDecimal)
    end
    it 'is expected to validate that :birthdate class eq Date' do 
      expect(@client.birthdate.class).to eq(Date)
    end
    it 'is expected to validate that :begindate class eq Date' do 
      expect(@client.begindate.class).to eq(Date)
    end
    it 'is expected to validate that :user_type class eq String' do 
      expect(@client.user_type.class).to eq(String)
    end
    it 'is expected to validate that :medical_name class eq String' do 
      expect(@client.medical_name.class).to eq(String)
    end
    it 'is expected to validate that :medical_address class eq String' do 
      expect(@client.medical_address.class).to eq(String)
    end
    it 'is expected to validate that :medical_email class eq String' do 
      expect(@client.medical_email.class).to eq(String)
    end
    it 'is expected to validate that :medical_telephone class eq String' do 
      expect(@client.medical_telephone.class).to eq(String)
    end
    it 'is expected to validate that :medical_type class eq String' do 
      expect(@client.medical_type.class).to eq(String)
    end
    it 'is expected to validate that :gender class eq String' do 
      expect(@client.gender.class).to eq(String)
    end
    it 'is expected to validate that :plan class eq Plan' do 
      expect(@client.plan.class).to eq(Plan)
    end
    it 'is expected to validate that :gym class eq Gym' do 
      expect(@client.gym.class).to eq(Gym)
    end
  end

  context 'Methods validations' do
    context 'Service methods' do
      it '#all_from' do
        clients = ClientService.all_from(@admin)
        expect(clients.count).to eq(1)
        expect(clients.first).to eq(@client)
        expect(clients.first.gym).to eq(@gym)
        expect(clients.class.name).to eq("ActiveRecord::Relation")
      end
      it '#save_for' do
        params = { 
          name: Faker::Name.name, 
          email: Faker::Internet.email, 
          weight: Faker::Number.between(from: 40, to: 100).to_f, 
          height: Faker::Demographic.height.to_f,
          user_type: CLIENT,
          gym: @gym
        }
        expect {
          ClientService.save_for(params, @admin)
        }.to change(Client, :count).by(1)
      end
      it '#delete' do
        ClientService.delete(@client)
        expect(@client.deleted).to eq(true)
      end
    end

    context 'Model methods' do
      it '#delete' do
        @client.delete
        expect(@client.deleted).to eq(true)
      end
    end
  end
  
end