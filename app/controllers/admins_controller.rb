class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :update, :destroy]

  # GET /admins
  def index
    @admins = Admin.all
    render json: serialize_admin(@admins, options)
  end

  # GET /admins/1
  def show
    render json: serialize_admin(@admin, options)
  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      render json: serialize_admin(@admin, options), status: :created, location: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admins/1
  def update
    if @admin.update(admin_params)
      render json: serialize_admin(@admin, options)
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admins/1
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
      params.require(:admin).permit(:name, :gym_id, :user_type)
    end

    def options
      @options ||= { include: %i[] } 
    end
end