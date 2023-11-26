# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe Api::V1::GymsController, type: :controller do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @admin = create(:admin, gym: @gym)
    # ADD HEADER
    request_header(@admin)
  end

  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { id: @gym.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    gym_params = attributes_for(:gym).merge({ gym_type_id: @gym.gym_type.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { gym: gym_params }
    }.to change(Gym, :count).by(1)
  end

  it "PUT /update" do
    gym_params = attributes_for(:gym)
    put :update, params: { id: @gym.id, gym: gym_params  }
    expect(response).to have_http_status(200)
  end

  it "DELETE /destroy" do
    delete :destroy, params: { id: @gym.id }
    expect(response).to have_http_status(204)
  end
end
