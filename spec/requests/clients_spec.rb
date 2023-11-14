require 'rails_helper'

RSpec.describe "ClientsRequest", type: :request do
  before(:each) do 
    # ADD HEADER
    @headers = { "ACCEPT" => "application/json" }
    # FACTORIES
    @client = create(:client)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema client" do
      get "/api/v1/clients/#{@client.id}.json", headers: @headers
      expect(response).to match_json_schema("client")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/clients.json", headers: @headers
      expect(response.body).to include_json(
        data: [
          {
            id: @client.id.to_s,
            type: "client",
            attributes: {
              name: @client.name,
              email: @client.email,
              weight: @client.weight.to_s,
              height: @client.height.to_s,
              birthdate: @client.birthdate,
              begindate: @client.begindate
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
      get "/api/v1/clients/#{@client.id}.json", headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @client.id.to_s,
          type: "client",
          attributes: {
            name: @client.name,
            email: @client.email,
            weight: @client.weight.to_s,
            height: @client.height.to_s,
            birthdate: @client.birthdate,
            begindate: @client.begindate
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
      client_params = build(:client, gym: @client.gym).attributes
      post "/api/v1/clients.json", params: { client: client_params }, headers: @headers
      client = Client.last
      expect(response.body).to include_json(
        data: {
          id: client.id.to_s,
          type: "client",
          attributes: {
            name: client.name,
            email: client.email,
            weight: client.weight.to_s,
            height: client.height.to_s,
            birthdate: client.birthdate,
            begindate: client.begindate
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
      patch "/api/v1/clients/#{@client.id}.json", params: { client: @client.attributes }, headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @client.id.to_s,
          type: "client",
          attributes: {
            name: @client.name,
            email: @client.email,
            weight: @client.weight.to_s,
            height: @client.height.to_s,
            birthdate: @client.birthdate,
            begindate: @client.begindate
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
