require 'rails_helper'

RSpec.describe "RecordsRequest", type: :request do
  before(:each) do 
    # ADD HEADER
    @headers = { "ACCEPT" => "application/json" }
    # FACTORIES
    @record = create(:record)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema record" do
      get "/api/v1/records/#{@record.id}.json", headers: @headers
      expect(response).to match_json_schema("record")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/records.json", headers: @headers
      expect(response.body).to include_json(
        data: [
          {
            id: @record.id.to_s,
            type: "record",
            attributes: {
              begin_date: @record.begin_date,
              end_date: @record.end_date,
              goal: @record.goal,
              interval: @record.interval,
              client: {
                id: @record.client.id,
                name: @record.client.name,
                weight: @record.client.weight.to_s,
                height: @record.client.height.to_s,
                birthdate: @record.client.birthdate,
                begindate: @record.client.begindate,
                user_type: @record.client.user_type
              }
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/records/#{@record.id}.json", headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @record.id.to_s,
          type: "record",
          attributes: {
            begin_date: @record.begin_date,
            end_date: @record.end_date,
            goal: @record.goal,
            interval: @record.interval,
            client: {
              id: @record.client.id,
              name: @record.client.name,
              weight: @record.client.weight.to_s,
              height: @record.client.height.to_s,
              birthdate: @record.client.birthdate,
              begindate: @record.client.begindate,
              user_type: @record.client.user_type
            }
          }
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      record_params = build(:record, client: @record.client, employee: @record.employee).attributes
      post "/api/v1/records.json", params: { record: record_params }, headers: @headers
      record = Record.last
      expect(response.body).to include_json(
        data: {
          id: record.id.to_s,
          type: "record",
          attributes: {
            begin_date: record.begin_date,
            end_date: record.end_date,
            goal: record.goal,
            interval: record.interval,
            client: {
              id: record.client.id,
              name: record.client.name,
              weight: record.client.weight.to_s,
              height: record.client.height.to_s,
              birthdate: record.client.birthdate,
              begindate: record.client.begindate,
              user_type: record.client.user_type
            }
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      patch "/api/v1/records/#{@record.id}.json", params: { record: @record.attributes }, headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @record.id.to_s,
          type: "record",
          attributes: {
            begin_date: @record.begin_date,
            end_date: @record.end_date,
            goal: @record.goal,
            interval: @record.interval,
            client: {
              id: @record.client.id,
              name: @record.client.name,
              weight: @record.client.weight.to_s,
              height: @record.client.height.to_s,
              birthdate: @record.client.birthdate,
              begindate: @record.client.begindate,
              user_type: @record.client.user_type
            }
          }
        }
      )
    end
  end

end
