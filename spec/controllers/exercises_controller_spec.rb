require 'rails_helper'

RSpec.describe Api::V1::ExercisesController, type: :controller do
  before(:each) do 
    # ADD HEADER
    request.headers.merge!({'Accept': 'application/json'})
    # FACTORIES
    @exercise = create(:exercise)
  end

  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { id: @exercise.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    exercise_params = attributes_for(:exercise).merge({ gym_id: @exercise.gym.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { exercise: exercise_params }
    }.to change(Exercise, :count).by(1)
  end

  it "PUT /update" do
    exercise_params = attributes_for(:exercise).merge({ gym_id: @exercise.gym.id})
    put :update, params: { id: @exercise.id, exercise: exercise_params  }
    expect(response).to have_http_status(200)
  end

  it "DELETE /destroy" do
    delete :destroy, params: { id: @exercise.id }
    expect(response).to have_http_status(204)
  end
end
