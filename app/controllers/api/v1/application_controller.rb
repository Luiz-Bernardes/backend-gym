class Api::V1::ApplicationController < ActionController::API
	# before_action :validate_json_request

	def validate_json_request
		return if request.headers["Accept"] =~ /json/
		render nothing: true, status: 406
	end
end
