class Api::V1::AuthenticateController < Api::V1::ApplicationController
	include Pundit::Authorization
	before_action :authenticate_api_v1_user!
	
	def pundit_user
    @current_api_v1_user
  end
end
