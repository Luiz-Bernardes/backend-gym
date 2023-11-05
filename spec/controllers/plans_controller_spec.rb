require 'rails_helper'

RSpec.describe PlansController, type: :controller do
  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    plan = create(:plan)
    get :show, params: { id: plan.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    plan_params = attributes_for(:plan)
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { plan: plan_params }
    }.to change(Plan, :count).by(1)
  end

  it "PUT /update" do
    plan_params = attributes_for(:plan)
    plan = create(:plan)
    put :update, params: { id: plan.id, plan: plan_params  }
    expect(response).to have_http_status(200)
  end

  it "DELETE /destroy" do
    plan = create(:plan)
    delete :destroy, params: { id: plan.id }
    expect(response).to have_http_status(204)
  end
end
