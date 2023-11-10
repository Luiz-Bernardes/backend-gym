require 'rails_helper'

RSpec.describe "TrainingExercisesRequest", type: :request do
  before(:each) do 
    @training_exercise = create(:training_exercise)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema training_exercise" do
      get "/api/v1/training_exercises/#{@training_exercise.id}.json"
      expect(response).to match_json_schema("training_exercise")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/training_exercises.json"
      expect(response.body).to include_json(
        data: [
          {
            id: @training_exercise.id.to_s,
            type: "training_exercise",
            attributes: {
              training: {
                name: @training_exercise.training.name,
                record_id: @training_exercise.training.record_id,
              },
              exercise: {
                name: @training_exercise.exercise.name,
                qnt_series: @training_exercise.exercise.qnt_series,
                qnt_repetitions: @training_exercise.exercise.qnt_repetitions,
                gym_id: @training_exercise.exercise.gym_id
              },
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/training_exercises/#{@training_exercise.id}.json"
      expect(response.body).to include_json(
        data: {
          id: @training_exercise.id.to_s,
          type: "training_exercise",
          attributes: {
            training: {
              name: @training_exercise.training.name,
              record_id: @training_exercise.training.record_id,
            },
            exercise: {
              name: @training_exercise.exercise.name,
              qnt_series: @training_exercise.exercise.qnt_series,
              qnt_repetitions: @training_exercise.exercise.qnt_repetitions,
              gym_id: @training_exercise.exercise.gym_id
            },
          }
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      training_exercise_params = build(:training_exercise, training: @training_exercise.training, exercise: @training_exercise.exercise).attributes
      post "/api/v1/training_exercises.json", params: { training_exercise: training_exercise_params }, headers: headers
      training_exercise = TrainingExercise.last
      expect(response.body).to include_json(
        data: {
          id: training_exercise.id.to_s,
          type: "training_exercise",
          attributes: {
            training: {
              name: training_exercise.training.name,
              record_id: training_exercise.training.record_id,
            },
            exercise: {
              name: training_exercise.exercise.name,
              qnt_series: training_exercise.exercise.qnt_series,
              qnt_repetitions: training_exercise.exercise.qnt_repetitions,
              gym_id: training_exercise.exercise.gym_id
            },
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      patch "/api/v1/training_exercises/#{@training_exercise.id}.json", params: { training_exercise: @training_exercise.attributes }, headers: headers
      expect(response.body).to include_json(
        data: {
          id: @training_exercise.id.to_s,
          type: "training_exercise",
          attributes: {
            training: {
              name: @training_exercise.training.name,
              record_id: @training_exercise.training.record_id,
            },
            exercise: {
              name: @training_exercise.exercise.name,
              qnt_series: @training_exercise.exercise.qnt_series,
              qnt_repetitions: @training_exercise.exercise.qnt_repetitions,
              gym_id: @training_exercise.exercise.gym_id
            },
          }
        }
      )
    end
  end

end
