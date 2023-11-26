# frozen_string_literal: true

require 'rails_helper'
require 'faker'
include ApplicationHelper

RSpec.describe Plan, type: :model do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @plan = create(:plan, gym: @gym)
    @admin = create(:admin, gym: @gym)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  context 'Create validation' do
    it 'is expected to create object plan with valid params' do
      expect(@plan).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :name class eq String' do 
      expect(@plan.name.class).to eq(String)
    end
    it 'is expected to validate that :price class eq BigDecimal' do 
      expect(@plan.price.class).to eq(BigDecimal)
    end
    it 'is expected to validate that :gym class eq BigDecimal' do 
      expect(@plan.gym.class).to eq(Gym)
    end
  end

  context 'Methods validations' do
    context 'Service methods' do
      it '#all_from' do
        plans = PlanService.all_from(@admin)
        expect(plans.count).to eq(1)
        expect(plans.first).to eq(@plan)
        expect(plans.first.gym).to eq(@gym)
        expect(plans.class.name).to eq("ActiveRecord::Relation")
      end
      it '#save_for' do
        params = { 
          name: Faker::FunnyName.name, 
          price: Faker::Number.between(from: 80, to: 150).to_f, 
          gym: @gym
        }
        expect {
          PlanService.save_for(params, @admin)
        }.to change(Plan, :count).by(1)
      end
      it '#delete' do
        PlanService.delete(@plan)
        expect(@plan.deleted).to eq(true)
      end
    end

    context 'Model methods' do
      it '#delete' do
        @plan.delete
        expect(@plan.deleted).to eq(true)
      end
    end
  end
  
end