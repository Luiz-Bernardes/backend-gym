require 'rails_helper'

RSpec.describe "ExercisesRequest", type: :request do
  before(:each) do 
    @exercise = create(:exercise)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema exercise" do
      get "/api/v1/exercises/#{@exercise.id}.json"
      expect(response).to match_json_schema("exercise")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/exercises.json"
      expect(response.body).to include_json(
        data: [
          {
            id: @exercise.id.to_s,
            type: "exercise",
            attributes: {
              name: @exercise.name,
              qnt_series: @exercise.qnt_series,
              qnt_repetitions: @exercise.qnt_repetitions
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/exercises/#{@exercise.id}.json"
      expect(response.body).to include_json(
        data: {
          id: @exercise.id.to_s,
          type: "exercise",
          attributes: {
            name: @exercise.name,
            qnt_series: @exercise.qnt_series,
            qnt_repetitions: @exercise.qnt_repetitions
          }
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      exercise_params = build(:exercise, gym: @exercise.gym).attributes
      post "/api/v1/exercises.json", params: { exercise: exercise_params }, headers: headers
      exercise = Exercise.last
      expect(response.body).to include_json(
        data: {
          id: exercise.id.to_s,
          type: "exercise",
          attributes: {
            name: exercise.name,
            qnt_series: exercise.qnt_series,
            qnt_repetitions: exercise.qnt_repetitions
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      @exercise.name = "Nome alterado"
      patch "/api/v1/exercises/#{@exercise.id}.json" , params: { exercise: @exercise.attributes }, headers: headers
      expect(response.body).to include_json(
        data: {
          id: @exercise.id.to_s,
          type: "exercise",
          attributes: {
            name: @exercise.name,
            qnt_series: @exercise.qnt_series,
            qnt_repetitions: @exercise.qnt_repetitions
          }
        }
      )
    end
  end

end