require 'rails_helper'

RSpec.describe "AppConfigsRequest", type: :request do
  before(:each) do 
    # ADD HEADER
    @headers = { "ACCEPT" => "application/json" }
    # FACTORIES
    @app_config = create(:app_config)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema app_config" do
      get "/api/v1/app_configs/#{@app_config.id}.json", headers: @headers
      expect(response).to match_json_schema("app_config")
    end
  end

  describe "GET" do
    it "show is expected response body to include json" do
      get "/api/v1/app_configs/#{@app_config.id}.json", headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @app_config.id.to_s,
          type: "app_config",
          attributes: {
            medical_attributes: @app_config.medical_attributes,
            gender_attribute: @app_config.gender_attribute
          }
        }
      )
    end 
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      patch "/api/v1/app_configs/#{@app_config.id}.json", params: { app_config: @app_config.attributes }, headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @app_config.id.to_s,
          type: "app_config",
          attributes: {
            medical_attributes: @app_config.medical_attributes,
            gender_attribute: @app_config.gender_attribute
          }
        }
      )
    end
  end

end