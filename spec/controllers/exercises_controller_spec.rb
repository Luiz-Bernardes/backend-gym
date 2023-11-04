require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do
  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    exercise = create(:exercise)
    get :show, params: { id: exercise.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    exercise_params = attributes_for(:exercise)
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { exercise: exercise_params }
    }.to change(Exercise, :count).by(1)
  end

  it "PUT /update" do
    exercise_params = attributes_for(:exercise)
    exercise = create(:exercise)
    put :update, params: { id: exercise.id, exercise: exercise_params  }
    expect(response).to have_http_status(200)
  end

  it "DELETE /destroy" do
    exercise = create(:exercise)
    delete :destroy, params: { id: exercise.id }
    expect(response).to have_http_status(204)
  end
end
