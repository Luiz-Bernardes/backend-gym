require 'rails_helper'
include ApplicationHelper

RSpec.describe Api::V1::EmployeesController, type: :controller do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @admin = create(:admin, gym: @gym)
    @employee = create(:employee, gym: @gym)
    # ADD HEADER
    request_header(@admin)
  end

  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { id: @employee.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    employee_params = attributes_for(:employee).merge({ gym_id: @employee.gym.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { employee: employee_params }
    }.to change(Employee, :count).by(1)
  end

  it "PUT /update" do
    employee_params = attributes_for(:employee).merge({ gym_id: @employee.gym.id})
    put :update, params: { id: @employee.id, employee: employee_params  }
    expect(response).to have_http_status(200)
  end

  it "DELETE /destroy" do
    delete :destroy, params: { id: @employee.id }
    expect(response).to have_http_status(204)
  end

end
