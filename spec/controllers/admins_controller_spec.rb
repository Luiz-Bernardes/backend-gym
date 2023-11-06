require 'rails_helper'

RSpec.describe Api::V1::AdminsController, type: :controller do
  before(:each) do 
    @admin = create(:admin)
    @gym = create(:gym)
  end

  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { id: @admin.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    admin_params = attributes_for(:admin).merge({ gym_id: @gym.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { admin: admin_params }
    }.to change(Admin, :count).by(1)
  end

  it "PUT /update" do
    admin_params = attributes_for(:admin).merge({ gym_id: @gym.id})
    put :update, params: { id: @admin.id, admin: admin_params  }
    expect(response).to have_http_status(200)
  end

end
