require 'rails_helper'
require 'faker'
include ApplicationHelper

RSpec.describe Employee, type: :model do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @employee = create(:employee, gym: @gym)
    @admin = create(:admin, gym: @gym)
    # ADD HEADER
    @headers = request_set_headers(@admin)
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
    it 'is expected to validate that :gender class eq String' do 
      expect(@employee.gender.class).to eq(String)
    end
    it 'is expected to validate that :gym class eq Gym' do 
      expect(@employee.gym.class).to eq(Gym)
    end
  end

  context 'Methods validations' do
    context 'Service methods' do
      it '#all_from' do
        employees = EmployeeService.all_from(@admin)
        expect(employees.count).to eq(1)
        expect(employees.first).to eq(@employee)
        expect(employees.first.gym).to eq(@gym)
        expect(employees.class.name).to eq("ActiveRecord::Relation")
      end
      it '#save_for' do
        params = { 
          name: Faker::Name.name, 
          email: Faker::Internet.email, 
          role: Faker::Construction.role,
          user_type: EMPLOYEE,
          gym: @gym
        }
        expect {
          EmployeeService.save_for(params, @admin)
        }.to change(Employee, :count).by(1)
      end
      it '#delete' do
        EmployeeService.delete(@employee)
        expect(@employee.deleted).to eq(true)
      end
    end

    context 'Model methods' do
      it '#delete' do
        @employee.delete
        expect(@employee.deleted).to eq(true)
      end
    end
  end
  
end