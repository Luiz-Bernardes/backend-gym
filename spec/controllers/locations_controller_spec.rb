require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    location = create(:location)
    get :show, params: { id: location.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    city = create(:city)
    location_params = attributes_for(:location).merge({ city_id: city.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { location: location_params }
    }.to change(Location, :count).by(1)
  end

  it "PUT /update" do
    location = create(:location)
    city = create(:city)
    location_params = attributes_for(:location).merge({ city_id: city.id})
    put :update, params: { id: location.id, location: location_params  }
    expect(response).to have_http_status(200)
  end

end
