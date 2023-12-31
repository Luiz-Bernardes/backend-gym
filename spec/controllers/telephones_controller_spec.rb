# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe Api::V1::TelephonesController, type: :controller do
  before(:each) do 
    # FACTORIES
    @admin = create(:admin)
    @telephone = create(:telephone)
    # ADD HEADER
    request_header(@admin)
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
