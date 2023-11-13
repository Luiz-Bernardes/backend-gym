class Api::V1::ApplicationController < ActionController::API
	include DeviseTokenAuth::Concerns::SetUserByToken
	before_action :validate_json_request
	before_action :configure_permitted_devise_parameters, if: :devise_controller?

	private
	def validate_json_request
		request_json = request.headers["Accept"] =~ /json/
		controller_test_host = request.host == "test.host"
		request_test_host = request.host == "www.example.com"
		return if request_json || controller_test_host || request_test_host
		render nothing: true, status: 406
	end

	protected
  def configure_permitted_devise_parameters
    # sign up parameters
    devise_parameter_sanitizer.permit(:sign_up, 
    	keys: [
    		:name, 
    		:user_type,
    		:gym_id,
    		telephones_attributes: [:number],
        locations_attributes: [
          :address,
          :number,
          :neighborhood,
          :complement,
          :city_id
        ]
    	])
  end
end
