require 'rails_helper'

RSpec.describe Api::V1::TrainingExercisesController, type: :controller do
  before(:each) do 
    # ADD HEADER
    request.headers.merge!({'Accept': 'application/json'})
    # FACTORIES
    @training_exercise = create(:training_exercise)
  end

  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { id: @training_exercise.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    training_exercise_params = attributes_for(:training_exercise).merge({ training_id: @training_exercise.training.id, exercise_id: @training_exercise.exercise.id })
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { training_exercise: training_exercise_params }
    }.to change(TrainingExercise, :count).by(1)
  end

  it "PUT /update" do
    training_exercise_params = attributes_for(:training_exercise).merge({ training_id: @training_exercise.training.id, exercise_id: @training_exercise.exercise.id })
    put :update, params: { id: @training_exercise.id, training_exercise: training_exercise_params  }
    expect(response).to have_http_status(200)
  end

  it "DELETE /destroy" do
    delete :destroy, params: { id: @training_exercise.id }
    expect(response).to have_http_status(204)
  end

end
