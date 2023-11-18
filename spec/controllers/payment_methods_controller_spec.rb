require 'rails_helper'

RSpec.describe Api::V1::PaymentMethodsController, type: :controller do
  before(:each) do 
    # ADD HEADER
    request.headers.merge!({'Accept': 'application/json'})
    # FACTORIES
    @payment_method = create(:payment_method)
  end

  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end
end
