require 'rails_helper'

RSpec.describe "PlansRequest", type: :request do
  before(:each) do 
    @plan = create(:plan)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema plan" do
      get "/api/v1/plans/#{@plan.id}.json"
      expect(response).to match_json_schema("plan")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/plans.json"
      expect(response.body).to include_json(
        data: [
          {
            id: @plan.id.to_s,
            type: "plan",
            attributes: {
              name: @plan.name,
              price: @plan.price.to_s
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/plans/#{@plan.id}.json"
      expect(response.body).to include_json(
        data: {
          id: @plan.id.to_s,
          type: "plan",
          attributes: {
            name: @plan.name,
            price: @plan.price.to_s
          }
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      plan_params = build(:plan, gym: @plan.gym).attributes
      post "/api/v1/plans.json", params: { plan: plan_params }, headers: headers
      plan = Plan.last
      expect(response.body).to include_json(
        data: {
          id: plan.id.to_s,
          type: "plan",
          attributes: {
            name: plan.name,
            price: plan.price.to_s
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      patch "/api/v1/plans/#{@plan.id}.json", params: { plan: @plan.attributes }, headers: headers
      expect(response.body).to include_json(
        data: {
          id: @plan.id.to_s,
          type: "plan",
          attributes: {
            name: @plan.name,
            price: @plan.price.to_s
          }
        }
      )
    end
  end

end
