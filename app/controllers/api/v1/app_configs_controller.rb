class Api::V1::AppConfigsController < Api::V1::ApplicationController
  # before_action :authenticate_api_v1_user!
  before_action :set_app_config, only: [:show, :update]

  # GET /api/v1/app_configs/1
  def show
    render json: serialize_app_config(@app_config, options)
  end

  # PATCH/PUT /api/v1/app_configs/1
  def update
    if @app_config.update(app_config_params)
      render json: serialize_app_config(@app_config, options)
    else
      render json: @app_config.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_config
      @app_config = AppConfig.find(params[:id])
    end

    def serialize_app_config query, options
      AppConfigSerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def app_config_params
      params.require(:app_config).permit(
        :medical_attributes, 
        :gender_attribute,
        :gym_id
      )
    end

    def options
      @options ||= { include: %i[] } 
    end
end
