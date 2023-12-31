# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe Api::V1::LocationsController, type: :controller do
  before(:each) do 
    # FACTORIES
    @admin = create(:admin)
    @location = create(:location)
    # ADD HEADER
    request_header(@admin)
  end

  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { id: @location.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    location_params = attributes_for(:location).merge({ city_id: @location.city.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { location: location_params }
    }.to change(Location, :count).by(1)
  end

  it "PUT /update" do
    location_params = attributes_for(:location).merge({ city_id: @location.city.id})
    put :update, params: { id: @location.id, location: location_params  }
    expect(response).to have_http_status(200)
  end

end
