class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :update, :destroy]

  # GET /locations
  def index
    @locations = Location.all
    render json: serialize_location(@locations, options)
  end

  # GET /locations/1
  def show
    render json: serialize_location(@location, options)
  end

  # POST /locations
  def create
    @location = Location.new(location_params)

    if @location.save
      render json: serialize_location(@location, options), status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(location_params)
      render json: serialize_location(@location, options)
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    def serialize_location query, options
      LocationSerializer.new(query, options).serialized_json
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.require(:location).permit(
        :address, 
        :number, 
        :neighborhood,
        :complement,
        :gym_id,
        :user_id,
        :city_id
      )
    end

    def options
      @options ||= { include: %i[] } 
    end
end
