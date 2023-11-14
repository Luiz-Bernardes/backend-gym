require 'rails_helper'

RSpec.describe "UsersRequest", type: :request do
  before(:each) do 
    # ADD HEADER
    @headers = { "ACCEPT" => "application/json" }
    # FACTORIES
    @user = create(:user)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema user" do
      get "/api/v1/users/#{@user.id}.json", headers: @headers
      expect(response).to match_json_schema("user")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/users.json", headers: @headers
      expect(response.body).to include_json(
        data: [
          {
            id: @user.id.to_s,
            type: "user",
            attributes: {
              name: @user.name,
              email: @user.email
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
      get "/api/v1/users/#{@user.id}.json", headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @user.id.to_s,
          type: "user",
          attributes: {
            name: @user.name,
            email: @user.email
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
      user_params = build(:user, gym: @user.gym).attributes
      post "/api/v1/users.json", params: { user: user_params }, headers: @headers
      user = User.last
      expect(response.body).to include_json(
        data: {
          id: user.id.to_s,
          type: "user",
          attributes: {
            name: user.name,
            email: user.email
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
      patch "/api/v1/users/#{@user.id}.json", params: { user: @user.attributes }, headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @user.id.to_s,
          type: "user",
          attributes: {
            name: @user.name,
            email: @user.email
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
