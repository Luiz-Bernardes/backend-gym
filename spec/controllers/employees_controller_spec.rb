require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    employee = create(:employee)
    get :show, params: { id: employee.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    gym = create(:gym)
    employee_params = attributes_for(:employee).merge({ gym_id: gym.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { employee: employee_params }
    }.to change(Employee, :count).by(1)
  end

  it "PUT /update" do
    employee = create(:employee)
    gym = create(:gym)
    employee_params = attributes_for(:employee).merge({ gym_id: gym.id})
    put :update, params: { id: employee.id, employee: employee_params  }
    expect(response).to have_http_status(200)
  end

end
