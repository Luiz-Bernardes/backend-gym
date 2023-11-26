# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe "GymsRequest", type: :request do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @admin = create(:admin, gym: @gym)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema gym" do
      get "/api/v1/gyms/#{@gym.id}.json", headers: @headers
      expect(response).to match_json_schema("gym")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/gyms.json", headers: @headers
      expect(response.body).to include_json(
        data: [
          {
            id: @gym.id.to_s,
            type: "gym",
            attributes: {
              name: @gym.name,
              cnpj: @gym.cnpj
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/gyms/#{@gym.id}.json", headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @gym.id.to_s,
          type: "gym",
          attributes: {
            name: @gym.name,
            cnpj: @gym.cnpj
          }
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      gym_params = build(:gym, gym_type: @gym.gym_type).attributes
      post "/api/v1/gyms.json", params: { gym: gym_params }, headers: @headers
      gym = Gym.last
      expect(response.body).to include_json(
        data: {
          id: gym.id.to_s,
          type: "gym",
          attributes: {
            name: gym.name,
            cnpj: gym.cnpj
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      @gym.name = "Nome alterado"
      patch "/api/v1/gyms/#{@gym.id}.json" , params: { gym: @gym.attributes }, headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @gym.id.to_s,
          type: "gym",
          attributes: {
            name: @gym.name,
            cnpj: @gym.cnpj
          }
        }
      )
    end
  end

end
