require 'rails_helper'

RSpec.describe Api::V1::CitiesController, type: :controller do
  before(:each) do 
    # ADD HEADER
    request.headers.merge!({'Accept': 'application/json'})
    # FACTORIES
    @city = create(:city)
  end

  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { id: @city.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    city_params = attributes_for(:city).merge({ state_id: @city.state.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { city: city_params }
    }.to change(City, :count).by(1)
  end

  it "PUT /update" do
    city_params = attributes_for(:city).merge({ state_id: @city.state.id})
    put :update, params: { id: @city.id, city: city_params  }
    expect(response).to have_http_status(200)
  end

end
