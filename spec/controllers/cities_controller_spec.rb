require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    city = create(:city)
    get :show, params: { id: city.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    state = create(:state)
    city_params = attributes_for(:city).merge({ state_id: state.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { city: city_params }
    }.to change(City, :count).by(1)
  end

  it "PUT /update" do
    city = create(:city)
    state = create(:state)
    city_params = attributes_for(:city).merge({ state_id: state.id})
    put :update, params: { id: city.id, city: city_params  }
    expect(response).to have_http_status(200)
  end

end
