# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "PaymentMethodsRequest", type: :request do
  before(:each) do 
    # FACTORIES
    @payment_method = create(:payment_method)
    # ADD HEADER
    @headers = { "ACCEPT" => "application/json" }
  end

  describe "JSON Schema " do
    it "json is expected to match json schema payment_method" do
      get "/api/v1/payment_methods/#{@payment_method.id}.json", headers: @headers
      expect(response).to match_json_schema("payment_method")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/payment_methods.json", headers: @headers
      expect(response.body).to include_json(
        data: [
          {
            id: @payment_method.id.to_s,
            type: "payment_method",
            attributes: {
              name: @payment_method.name,
              slug: @payment_method.slug
            }
          }
        ]
      )
    end
  end
end
