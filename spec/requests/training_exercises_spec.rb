# frozen_string_literal: true

require 'rails_helper'
include ApplicationHelper

RSpec.describe "TrainingExercisesRequest", type: :request do
  before(:each) do 
    # FACTORIES
    @training_exercise = create(:training_exercise)
    @admin = create(:admin)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema training_exercise" do
      get "/api/v1/training_exercises/#{@training_exercise.id}.json", headers: @headers
      expect(response).to match_json_schema("training_exercise")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/training_exercises.json", headers: @headers
      expect(response.body).to include_json(
        data: [
          {
            id: @training_exercise.id.to_s,
            type: "training_exercise",
            attributes: {}
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/training_exercises/#{@training_exercise.id}.json", headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @training_exercise.id.to_s,
          type: "training_exercise",
          attributes: {}
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      training_exercise_params = build(:training_exercise, training: @training_exercise.training, exercise: @training_exercise.exercise).attributes
      post "/api/v1/training_exercises.json", params: { training_exercise: training_exercise_params }, headers: @headers
      training_exercise = TrainingExercise.last
      expect(response.body).to include_json(
        data: {
          id: training_exercise.id.to_s,
          type: "training_exercise",
          attributes: {}
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      patch "/api/v1/training_exercises/#{@training_exercise.id}.json", params: { training_exercise: @training_exercise.attributes }, headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @training_exercise.id.to_s,
          type: "training_exercise",
          attributes: {}
        }
      )
    end
  end

end
