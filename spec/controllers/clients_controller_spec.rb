# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe Api::V1::ClientsController, type: :controller do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @admin = create(:admin, gym: @gym)
    @client = create(:client, gym: @gym)
    # ADD HEADER
    request_header(@admin)
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

  it "DELETE /destroy" do
    delete :destroy, params: { id: @client.id }
    expect(response).to have_http_status(204)
  end

end
