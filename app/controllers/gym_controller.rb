class GymController < ApplicationController
	# GET /regions
	def index
	  @regions = Region.all

	  render json: serialize_region(@regions, options)
	end

	# GET /regions/1
	def show
	  render json: serialize_region(@region, options)
	end

	# POST /regions
	def create
	  @region = Region.new(region_params)

	  if @region.save
	    render json: serialize_region(@region, options), status: :created, location: @region
	  else
	    render json: @region.errors, status: :unprocessable_entity
	  end
	end

	# PATCH/PUT /regions/1
	def update
	  if @region.update(region_params)
	    render json: serialize_region(@region, options)
	  else
	    render json: @region.errors, status: :unprocessable_entity
	  end
	end

	# DELETE /regions/1
	def destroy
	  @region.destroy
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_region
	    @region = Region.find(params[:id])
	  end

	  def serialize_region query, options
	    RegionSerializer.new(query, options).serialized_json
	  end

	  # Only allow a trusted parameter "white list" through.
	  def region_params
	    params.require(:region).permit(:name, :generation, :games, :pokedex_count)
	  end

	  def options
	    @options ||= { include: %i[pokemons] } 
	  end
end
