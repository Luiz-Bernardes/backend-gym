require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    client = create(:client)
    get :show, params: { id: client.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    gym = create(:gym)
    client_params = attributes_for(:client).merge({ gym_id: gym.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { client: client_params }
    }.to change(Client, :count).by(1)
  end

  it "PUT /update" do
    client = create(:client)
    gym = create(:gym)
    client_params = attributes_for(:client).merge({ gym_id: gym.id})
    put :update, params: { id: client.id, client: client_params  }
    expect(response).to have_http_status(200)
  end

end
