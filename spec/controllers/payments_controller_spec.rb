require 'rails_helper'

RSpec.describe Api::V1::PaymentsController, type: :controller do
  before(:each) do 
    # ADD HEADER
    request.headers.merge!({'Accept': 'application/json'})
    # FACTORIES
    @payment = create(:payment)
  end

  it "GET /index" do
    get :index, params: { client_id: @payment.client.id }
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { client_id: @payment.client.id, id: @payment.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    payment_params = attributes_for(:payment).merge({ client_id: @payment.client.id, payment_method_id: @payment.payment_method.id })
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { client_id: @payment.client.id, payment: payment_params }
    }.to change(Payment, :count).by(1)
  end

  it "PUT /update" do
    payment = create(:payment, client_id: @payment.client.id)
    payment_params = attributes_for(:payment).merge({ client_id: @payment.client.id, payment_method_id: @payment.payment_method.id })
    put :update, params: { id: payment.id, client_id: @payment.client.id, payment: payment_params }
    expect(response).to have_http_status(200)
  end

end
