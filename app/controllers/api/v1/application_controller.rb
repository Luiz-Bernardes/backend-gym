class Api::V1::ApplicationController < ActionController::API
	include DeviseTokenAuth::Concerns::SetUserByToken
	before_action :validate_json_request
	before_action :configure_permitted_devise_parameters, if: :devise_controller?
	after_action :store_user_activities, if: :save_actions?

	def store_user_activities
		@current_user_id = 1.to_s
		file_path = "app/logs/activities_user_#{@current_user_id}.txt"
		file_obj = open_file(file_path)
		text_content = set_file_log
		# Write file
		file_obj = File.write(
			file_path, 
			text_content, 
			File.size(file_path), 
			mode: 'a'
		)
	end

	def open_file(file_path)
		if !File.exists?(file_path)
			file_obj = File.new(file_path, "w+") 
		else
			file_obj = File.open(file_path, "a")
		end
		file_obj
	end

	def set_file_log
		text_content = ""
		text_content << "{ user_id: " + @current_user_id + " } ~ "
		text_content << "{ controller: " + controller_name + " } ~ "
		text_content << "{ action: " + action_name + " } ~ "
		text_content << "{ date_time: " + DateTime.now.strftime("%d/%m/%Y %H:%M") + " } ~ "
		text_content << "{ browser: " + request.env['HTTP_USER_AGENT'] + " } ~ "
		text_content << "{ ip_address: " + request.env['REMOTE_ADDR'] + " } \n"
		text_content
	end

	def save_actions?
		(action_name == "update") || (action_name == "create")
	end


	private
	def validate_json_request
		return if request.headers["Accept"] =~ /json/
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
