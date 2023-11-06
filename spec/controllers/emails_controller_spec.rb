require 'rails_helper'

RSpec.describe Api::V1::EmailsController, type: :controller do
  before(:each) do 
    @email = create(:email)
  end

  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { id: @email.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    email_params = attributes_for(:email)
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { email: email_params }
    }.to change(Email, :count).by(1)
  end

  it "PUT /update" do
    email_params = attributes_for(:email)
    put :update, params: { id: @email.id, email: email_params  }
    expect(response).to have_http_status(200)
  end

  it "DELETE /destroy" do
    delete :destroy, params: { id: @email.id }
    expect(response).to have_http_status(204)
  end
end
