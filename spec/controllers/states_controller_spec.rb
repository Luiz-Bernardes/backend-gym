require 'rails_helper'

RSpec.describe Api::V1::StatesController, type: :controller do
  before(:each) do 
    @state = create(:state)
  end

  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { id: @state.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    state_params = attributes_for(:state)
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { state: state_params }
    }.to change(State, :count).by(1)
  end

  it "PUT /update" do
    state_params = attributes_for(:state)
    put :update, params: { id: @state.id, state: state_params  }
    expect(response).to have_http_status(200)
  end  
end
