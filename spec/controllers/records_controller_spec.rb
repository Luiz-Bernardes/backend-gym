require 'rails_helper'

RSpec.describe RecordsController, type: :controller do
  before(:each) do 
    @record = create(:record)
    @client = create(:client)
  end

  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    get :show, params: { id: @record.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    record_params = attributes_for(:record).merge({ client_id: @client.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { record: record_params }
    }.to change(Record, :count).by(1)
  end

  it "PUT /update" do
    record_params = attributes_for(:record).merge({ client_id: @client.id})
    put :update, params: { id: @record.id, record: record_params  }
    expect(response).to have_http_status(200)
  end

end
