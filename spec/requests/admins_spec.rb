require 'rails_helper'

RSpec.describe "AdminsRequest", type: :request do
  before(:each) do 
    @admin = create(:admin)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema admin" do
      get "/api/v1/admins/#{@admin.id}.json"
      expect(response).to match_json_schema("admin")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/admins.json"
      expect(response.body).to include_json(
        data: [
          {
            id: @admin.id.to_s,
            type: "admin",
            attributes: {
              name: @admin.name,
              email: @admin.email
            },
            relationships: {
              telephones: {
                data: []
              },
              locations: {
                data: []
              }
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/admins/#{@admin.id}.json"
      expect(response.body).to include_json(
        data: {
          id: @admin.id.to_s,
          type: "admin",
          attributes: {
            name: @admin.name,
            email: @admin.email
          },
          relationships: {
            telephones: {
              data: []
            },
            locations: {
              data: []
            }
          }

        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      admin_params = build(:admin, gym: @admin.gym).attributes
      post "/api/v1/admins.json", params: { admin: admin_params }, headers: headers
      admin = Admin.last
      expect(response.body).to include_json(
        data: {
          id: admin.id.to_s,
          type: "admin",
          attributes: {
            name: admin.name,
            email: admin.email
          },
          relationships: {
            telephones: {
              data: []
            },
            locations: {
              data: []
            }
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      patch "/api/v1/admins/#{@admin.id}.json", params: { admin: @admin.attributes }, headers: headers
      expect(response.body).to include_json(
        data: {
          id: @admin.id.to_s,
          type: "admin",
          attributes: {
            name: @admin.name,
            email: @admin.email
          },
          relationships: {
            telephones: {
              data: []
            },
            locations: {
              data: []
            }
          }
        }
      )
    end
  end

end
