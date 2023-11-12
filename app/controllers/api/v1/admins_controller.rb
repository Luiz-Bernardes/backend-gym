class Api::V1::AdminsController < Api::V1::ApplicationController
  before_action :set_admin, only: [:show, :update, :destroy]

  # GET /api/v1/admins
  def index
    @admins = Admin.all
    render json: serialize_admin(@admins, options)
  end

  # GET /api/v1/admins/1
  def show
    render json: serialize_admin(@admin, options)
  end

  # POST /api/v1/admins
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      render json: serialize_admin(@admin, options), status: :created
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/admins/1
  def update
    if @admin.update(admin_params)
      render json: serialize_admin(@admin, options)
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/admins/1
  def destroy
    @admin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def serialize_admin query, options
      AdminSerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.require(:admin).permit(
        :name, 
        :email,
        :gym_id, 
        :user_type,
        telephones_attributes: [:number],
        locations_attributes: [
          :address,
          :number,
          :neighborhood,
          :complement,
          :city_id
        ]
      )
    end

    def options
      @options ||= { include: %i[telephones locations] } 
    end
end