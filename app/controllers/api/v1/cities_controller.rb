class Api::V1::CitiesController < Api::V1::ApplicationController
  before_action :set_city, only: [:show, :update, :destroy]

  # GET /api/v1/cities
  def index
    @cities = City.all
    render json: serialize_city(@cities, options)
  end

  # GET /api/v1/cities/1
  def show
    render json: serialize_city(@city, options)
  end

  # POST /api/v1/cities
  def create
    @city = City.new(city_params)

    if @city.save
      render json: serialize_city(@city, options), status: :created
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/cities/1
  def update
    if @city.update(city_params)
      render json: serialize_city(@city, options)
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/cities/1
  def destroy
    @city.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    def serialize_city query, options
      CitySerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def city_params
      params.require(:city).permit(:name, :state_id)
    end

    def options
      @options ||= { include: %i[] } 
    end
end