# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe "LocationsRequest", type: :request do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @user = create(:user)
    @city = create(:city)
    @location = create(:location, gym: @gym, user: @user, city: @city)
    @admin = create(:admin)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema location" do
      get "/api/v1/locations/#{@location.id}.json", headers: @headers
      expect(response).to match_json_schema("location")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/locations.json", headers: @headers
      expect(response.body).to include_json(
        data: [
          {
            id: @location.id.to_s,
            type: "location",
            attributes: {
              address: @location.address,
              number: @location.number,
              neighborhood: @location.neighborhood,
              complement: @location.complement
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/locations/#{@location.id}.json", headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @location.id.to_s,
          type: "location",
          attributes: {
            address: @location.address,
            number: @location.number,
            neighborhood: @location.neighborhood,
            complement: @location.complement
          }
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      location_params = build(:location, gym: @gym, user: @user, city: @city).attributes
      post "/api/v1/locations.json", params: { location: location_params }, headers: @headers
      location = Location.last
      expect(response.body).to include_json(
        data: {
          id: location.id.to_s,
          type: "location",
          attributes: {
            address: location.address,
            number: location.number,
            neighborhood: location.neighborhood,
            complement: location.complement
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      patch "/api/v1/locations/#{@location.id}.json" , params: { location: @location.attributes }, headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @location.id.to_s,
          type: "location",
          attributes: {
            address: @location.address,
            number: @location.number,
            neighborhood: @location.neighborhood,
            complement: @location.complement
          }
        }
      )
    end
  end

end
