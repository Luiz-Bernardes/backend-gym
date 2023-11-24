require 'rails_helper'
include ApplicationHelper

RSpec.describe "TrainingsRequest", type: :request do
  before(:each) do 
    # FACTORIES
    @training = create(:training)
    @admin = create(:admin)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema training" do
      get "/api/v1/records/#{@training.record.id}/trainings/#{@training.id}.json", headers: @headers
      expect(response).to match_json_schema("training")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/records/#{@training.record.id}/trainings.json", headers: @headers
      expect(response.body).to include_json(
        data: [
          {
            id: @training.id.to_s,
            type: "training",
            attributes: {
              name: @training.name
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/records/#{@training.record.id}/trainings/#{@training.id}.json", headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @training.id.to_s,
          type: "training",
          attributes: {
            name: @training.name
          }
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      training_params = build(:training, record: @training.record).attributes
      post "/api/v1/records/#{@training.record.id}/trainings.json", params: { training: training_params }, headers: @headers
      training = Training.last
      expect(response.body).to include_json(
        data: {
          id: training.id.to_s,
          type: "training",
          attributes: {
            name: training.name
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      patch "/api/v1/records/#{@training.record.id}/trainings/#{@training.id}.json", params: { training: @training.attributes }, headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @training.id.to_s,
          type: "training",
          attributes: {
            name: @training.name
          }
        }
      )
    end
  end

end
