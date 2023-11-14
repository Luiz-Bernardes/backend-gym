require 'rails_helper'

RSpec.describe "CitiesRequest", type: :request do
  before(:each) do 
    # ADD HEADER
    @headers = { "ACCEPT" => "application/json" }
    # FACTORIES
    @city = create(:city)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema city" do
      get "/api/v1/cities/#{@city.id}.json", headers: @headers
      expect(response).to match_json_schema("city")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/cities.json", headers: @headers
      expect(response.body).to include_json(
        data: [
          {
            id: @city.id.to_s,
            type: "city",
            attributes: {
              name: @city.name,
              state: {
                id: @city.state.id,
                name: @city.state.name,
                uf: @city.state.uf
              }
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/cities/#{@city.id}.json", headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @city.id.to_s,
          type: "city",
          attributes: {
            name: @city.name,
            state: {
              id: @city.state.id,
              name: @city.state.name,
              uf: @city.state.uf
            }
          }
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      city_params = build(:city, state: @city.state).attributes
      post "/api/v1/cities.json", params: { city: city_params }, headers: @headers
      city = City.last
      expect(response.body).to include_json(
        data: {
          id: city.id.to_s,
          type: "city",
          attributes: {
            name: city.name,
            state: {
              id: city.state.id,
              name: city.state.name,
              uf: city.state.uf
            }
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      patch "/api/v1/cities/#{@city.id}.json", params: { city: @city.attributes }, headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @city.id.to_s,
          type: "city",
          attributes: {
            name: @city.name,
            state: {
              id: @city.state.id,
              name: @city.state.name,
              uf: @city.state.uf
            }
          }
        }
      )
    end
  end

end
