require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before(:each) do 
    # ADD HEADER
    request.headers.merge!({'Accept': 'application/json'})
    # FACTORIES
    @user = create(:user)
  end

  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { id: @user.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    user_params = attributes_for(:user).merge({ gym_id: @user.gym.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { user: user_params }
    }.to change(User, :count).by(1)
  end

  it "PUT /update" do
    user_params = attributes_for(:user).merge({ gym_id: @user.gym.id})
    put :update, params: { id: @user.id, user: user_params  }
    expect(response).to have_http_status(200)
  end

end
