# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe "PaymentsRequest", type: :request do
  before(:each) do 
    # FACTORIES
    @payment = create(:payment)
    @admin = create(:admin)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema payment" do
      get "/api/v1/clients/#{@payment.client.id}/payments/#{@payment.id}.json", headers: @headers
      expect(response).to match_json_schema("payment")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/clients/#{@payment.client.id}/payments.json", headers: @headers
      expect(response.body).to include_json(
        data: [
          {
            id: @payment.id.to_s,
            type: "payment",
            attributes: {
              value: @payment.value.to_s,
              amount_paid: @payment.amount_paid.to_s,
              payment_date: @payment.payment_date.to_s,
              due_date: @payment.due_date.to_s
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/clients/#{@payment.client.id}/payments/#{@payment.id}.json", headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @payment.id.to_s,
          type: "payment",
          attributes: {
            value: @payment.value.to_s,
            amount_paid: @payment.amount_paid.to_s,
            payment_date: @payment.payment_date.to_s,
            due_date: @payment.due_date.to_s
          }
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      payment_params = build(:payment, payment_method: @payment.payment_method, client: @payment.client).attributes
      post "/api/v1/clients/#{@payment.client.id}/payments.json", params: { payment: payment_params }, headers: @headers
      payment = Payment.last
      expect(response.body).to include_json(
        data: {
          id: payment.id.to_s,
          type: "payment",
          attributes: {
            value: payment.value.to_s,
            amount_paid: payment.amount_paid.to_s,
            payment_date: payment.payment_date.to_s,
            due_date: payment.due_date.to_s
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      patch "/api/v1/clients/#{@payment.client.id}/payments/#{@payment.id}.json" , params: { payment: @payment.attributes }, headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @payment.id.to_s,
          type: "payment",
          attributes: {
            value: @payment.value.to_s,
            amount_paid: @payment.amount_paid.to_s,
            payment_date: @payment.payment_date.to_s,
            due_date: @payment.due_date.to_s
          }
        }
      )
    end
  end

end
