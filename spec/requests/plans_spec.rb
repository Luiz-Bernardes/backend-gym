require 'rails_helper'

RSpec.describe "PlansRequest", type: :request do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @admin = create(:admin, gym: @gym)
    @plan = create(:plan, gym: @gym)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema plan" do
      get "/api/v1/plans/#{@plan.id}.json", headers: @headers
      expect(response).to match_json_schema("plan")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/plans.json", headers: @headers
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
      get "/api/v1/plans/#{@plan.id}.json", headers: @headers
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
      plan_params = build(:plan, gym: @plan.gym).attributes
      post "/api/v1/plans.json", params: { plan: plan_params }, headers: @headers
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
      patch "/api/v1/plans/#{@plan.id}.json", params: { plan: @plan.attributes }, headers: @headers
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
