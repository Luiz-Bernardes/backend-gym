require 'rails_helper'
include ApplicationHelper

RSpec.describe Api::V1::AppConfigsController, type: :controller do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @admin = create(:admin, gym: @gym)
    @app_config = create(:app_config, gym: @gym)
    # ADD HEADER
    request_header(@admin)
  end

  it "GET /show" do
    get :show, params: { id: @app_config.id }
    expect(response).to have_http_status(200)
  end

  it "PUT /update" do
    app_config_params = attributes_for(:app_config).merge({ gym_id: @app_config.gym.id})
    put :update, params: { id: @app_config.id, app_config: app_config_params  }
    expect(response).to have_http_status(200)
  end

end
