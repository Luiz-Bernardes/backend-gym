require 'rails_helper'

RSpec.describe Api::V1::ClientsController, type: :controller do
  before(:each) do 
    @client = create(:client)
  end

  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { id: @client.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    client_params = attributes_for(:client).merge({ gym_id: @client.gym.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { client: client_params }
    }.to change(Client, :count).by(1)
  end

  it "PUT /update" do
    client_params = attributes_for(:client).merge({ gym_id: @client.gym.id})
    put :update, params: { id: @client.id, client: client_params  }
    expect(response).to have_http_status(200)
  end

end
