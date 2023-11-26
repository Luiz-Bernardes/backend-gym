# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe "ClientsRequest", type: :request do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @admin = create(:admin, gym: @gym)
    @client = create(:client, gym: @gym)
    # ADD HEADER
    @headers = request_set_headers(@admin)
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
              birthdate: @client.birthdate.to_s,
              begindate: @client.begindate.to_s,
              medical_name: @client.medical_name,
              medical_address: @client.medical_address,
              medical_email: @client.medical_email,
              medical_telephone: @client.medical_telephone,
              medical_type: @client.medical_type,
              gender: @client.gender
            },
            relationships: {
              telephones: {
                data: []
              },
              locations: {
                data: []
              },
              payments: {
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
            birthdate: @client.birthdate.to_s,
            begindate: @client.begindate.to_s,
            medical_name: @client.medical_name,
            medical_address: @client.medical_address,
            medical_email: @client.medical_email,
            medical_telephone: @client.medical_telephone,
            medical_type: @client.medical_type,
            gender: @client.gender
          },
          relationships: {
            telephones: {
              data: []
            },
            locations: {
              data: []
            },
            payments: {
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
            birthdate: client.birthdate.to_s,
            begindate: client.begindate.to_s,
            medical_name: client.medical_name,
            medical_address: client.medical_address,
            medical_email: client.medical_email,
            medical_telephone: client.medical_telephone,
            medical_type: client.medical_type,
            gender: client.gender
          },
          relationships: {
            telephones: {
              data: []
            },
            locations: {
              data: []
            },
            payments: {
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
            birthdate: @client.birthdate.to_s,
            begindate: @client.begindate.to_s,
            medical_name: @client.medical_name,
            medical_address: @client.medical_address,
            medical_email: @client.medical_email,
            medical_telephone: @client.medical_telephone,
            medical_type: @client.medical_type,
            gender: @client.gender
          },
          relationships: {
            telephones: {
              data: []
            },
            locations: {
              data: []
            },
            payments: {
              data: []
            }
          }
        }
      )
    end
  end

end
