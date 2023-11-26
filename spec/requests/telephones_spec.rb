# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe "TelephonesRequest", type: :request do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @user = create(:user)
    @telephone = create(:telephone, gym: @gym, user: @user)
    @admin = create(:admin, gym: @gym)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema telephone" do
      get "/api/v1/telephones/#{@telephone.id}.json", headers: @headers
      expect(response).to match_json_schema("telephone")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/telephones.json", headers: @headers
      expect(response.body).to include_json(
        data: [
          {
            id: @telephone.id.to_s,
            type: "telephone",
            attributes: {
              number: @telephone.number
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/telephones/#{@telephone.id}.json", headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @telephone.id.to_s,
          type: "telephone",
          attributes: {
            number: @telephone.number
          }
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      telephone_params = build(:telephone, gym: @gym, user: @user).attributes
      post "/api/v1/telephones.json", params: { telephone: telephone_params }, headers: @headers
      telephone = Telephone.last
      expect(response.body).to include_json(
        data: {
          id: telephone.id.to_s,
          type: "telephone",
          attributes: {
            number: telephone.number
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      patch "/api/v1/telephones/#{@telephone.id}.json" , params: { telephone: @telephone.attributes }, headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @telephone.id.to_s,
          type: "telephone",
          attributes: {
            number: @telephone.number
          }
        }
      )
    end
  end

end
