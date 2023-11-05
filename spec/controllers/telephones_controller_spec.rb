require 'rails_helper'

RSpec.describe TelephonesController, type: :controller do
  before(:each) do 
    @telephone = create(:telephone)
  end

  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { id: @telephone.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    telephone_params = attributes_for(:telephone)
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { telephone: telephone_params }
    }.to change(Telephone, :count).by(1)
  end

  it "PUT /update" do
    telephone_params = attributes_for(:telephone)
    put :update, params: { id: @telephone.id, telephone: telephone_params  }
    expect(response).to have_http_status(200)
  end

  it "DELETE /destroy" do
    delete :destroy, params: { id: @telephone.id }
    expect(response).to have_http_status(204)
  end
end
