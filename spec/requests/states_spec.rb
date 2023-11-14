require 'rails_helper'

RSpec.describe "StatesRequest", type: :request do
  before(:each) do 
    # ADD HEADER
    @headers = { "ACCEPT" => "application/json" }
    # FACTORIES
    @state = create(:state)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema state" do
      get "/api/v1/states/#{@state.id}.json", headers: @headers
      expect(response).to match_json_schema("state")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/states.json", headers: @headers
      expect(response.body).to include_json(
        data: [
          {
            id: @state.id.to_s,
            type: "state",
            attributes: {
              name: @state.name,
              uf: @state.uf
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/states/#{@state.id}.json", headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @state.id.to_s,
          type: "state",
          attributes: {
            name: @state.name,
            uf: @state.uf
          }
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      state_params = attributes_for(:state)
      post "/api/v1/states.json", params: { state: state_params }, headers: @headers
      state = State.last
      expect(response.body).to include_json(
        data: {
          id: state.id.to_s,
          type: "state",
          attributes: {
            name: state.name,
            uf: state.uf
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      @state.name = "Nome alterado"
      patch "/api/v1/states/#{@state.id}.json" , params: { state: @state.attributes }, headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @state.id.to_s,
          type: "state",
          attributes: {
            name: @state.name,
            uf: @state.uf
          }
        }
      )
    end
  end

end
