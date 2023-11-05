require 'rails_helper'

RSpec.describe TrainingsController, type: :controller do
  before(:each) do 
    @record = create(:record)
    @training = create(:training)
  end

  it "GET /index" do
    get :index, params: { record_id: @record.id }
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { record_id: @record.id, id: @training.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    training_params = attributes_for(:training).merge({ record_id: @record.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { record_id: @record.id, training: training_params }
    }.to change(Training, :count).by(1)
  end

  it "PUT /update" do
    training = create(:training, record_id: @record.id)
    training_params = attributes_for(:training).merge({ record_id: @record.id})
    put :update, params: { id: training.id, record_id: @record.id, training: training_params }
    expect(response).to have_http_status(200)
  end

end