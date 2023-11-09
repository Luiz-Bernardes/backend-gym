require 'rails_helper'

RSpec.describe "TrainingsRequest", type: :request do
  before(:each) do 
    @training = create(:training)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema training" do
      get "/api/v1/records/#{@training.record.id}/trainings/#{@training.id}.json"
      expect(response).to match_json_schema("training")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/records/#{@training.record.id}/trainings.json"
      expect(response.body).to include_json(
        data: [
          {
            id: @training.id.to_s,
            type: "training",
            attributes: {
              name: @training.name,
              record: {
                id: @training.record.id,
                begin_date: @training.record.begin_date,
                end_date: @training.record.end_date,
                interval: @training.record.interval,
                goal: @training.record.goal
              }
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/records/#{@training.record.id}/trainings/#{@training.id}.json"
      expect(response.body).to include_json(
        data: {
          id: @training.id.to_s,
          type: "training",
          attributes: {
            name: @training.name,
            record: {
              id: @training.record.id,
              begin_date: @training.record.begin_date,
              end_date: @training.record.end_date,
              interval: @training.record.interval,
              goal: @training.record.goal
            }
          }
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      training_params = build(:training, record: @training.record).attributes
      post "/api/v1/records/#{@training.record.id}/trainings.json", params: { training: training_params }, headers: headers
      training = Training.last
      expect(response.body).to include_json(
        data: {
          id: training.id.to_s,
          type: "training",
          attributes: {
            name: training.name,
            record: {
              id: training.record.id,
              begin_date: training.record.begin_date,
              end_date: training.record.end_date,
              interval: training.record.interval,
              goal: training.record.goal
            }
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      patch "/api/v1/records/#{@training.record.id}/trainings/#{@training.id}.json", params: { training: @training.attributes }, headers: headers
      expect(response.body).to include_json(
        data: {
          id: @training.id.to_s,
          type: "training",
          attributes: {
            name: @training.name,
            record: {
              id: @training.record.id,
              begin_date: @training.record.begin_date,
              end_date: @training.record.end_date,
              interval: @training.record.interval,
              goal: @training.record.goal
            }
          }
        }
      )
    end
  end

end
