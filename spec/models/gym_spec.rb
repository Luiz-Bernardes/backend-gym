# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe Gym, type: :model do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @admin = create(:admin, gym: @gym)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  context 'Create validation' do
    it 'is expected to create object gym with valid params' do
      expect(@gym).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
  end

  context 'Association validations' do
    it { should belong_to(:gym_type) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :name class eq String' do 
      expect(@gym.name.class).to eq(String)
    end
    it 'is expected to validate that :cnpj class eq String' do 
      expect(@gym.cnpj.class).to eq(String)
    end
    it 'is expected to validate that :slug class eq String' do 
      expect(@gym.slug.class).to eq(String)
    end
    it 'is expected to validate that :gym_type class eq GymType' do 
      expect(@gym.gym_type.class).to eq(GymType)
    end
  end

  context 'Methods validations' do
    context 'Service methods' do
      it '#find_by_slug_or_id' do 
        gym_by_id = GymService.find_by_slug_or_id(@gym.id)
        gym_by_slug = GymService.find_by_slug_or_id(@gym.slug)
        expect(gym_by_id.class.name).to eq("Gym")
        expect(gym_by_slug.class.name).to eq("Gym")
      end
      it '#find_owner' do
        expect(GymService.find_owner(@gym).name).to eq(@admin.name)
      end
      it '#find_users' do
        expect(GymService.find_users(@gym, CLIENT).count).to eq(GymService.count_users(@gym, CLIENT))
        expect(GymService.find_users(@gym, EMPLOYEE).count).to eq(GymService.count_users(@gym, EMPLOYEE))
        expect(GymService.find_users(@gym, ADMIN).count).to eq(GymService.count_users(@gym, ADMIN))
      end
    end

    context 'Model methods' do
      it '#owner' do
        expect(@gym.owner[:name]).to eq(@admin.name)
      end
      it '#count_clients' do
        expect(@gym.count_clients).to eq(GymService.count_users(@gym, CLIENT))
      end
      it '#count_employees' do
        expect(@gym.count_employees).to eq(GymService.count_users(@gym, EMPLOYEE))
      end
      it '#count_admins' do
        expect(@gym.count_admins).to eq(GymService.count_users(@gym, ADMIN))
      end
    end

    context 'observers' do
      it 'app_config create' do
        expect(@gym.app_config.nil?).to be_falsey
      end
    end
  end
  
end
