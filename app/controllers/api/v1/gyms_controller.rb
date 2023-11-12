class Api::V1::GymsController < Api::V1::ApplicationController
	before_action :set_list_gym, only: [:show]
	before_action :set_gym, only: [:update, :destroy]

	# GET /api/v1/gyms
	def index
	  @gyms = Gym.all
	  render json: serialize_gym(@gyms, options)
	end

	# GET /api/v1/gyms/1
	def show
	  render json: serialize_gym(@gym, options)
	end

	# POST /api/v1/gyms
	def create
	  @gym = Gym.new(gym_params)

	  if @gym.save
	    render json: serialize_gym(@gym, options), status: :created
	  else
	    render json: @gym.errors, status: :unprocessable_entity
	  end
	end

	# PATCH/PUT /api/v1/gyms/1
	def update
	  if @gym.update(gym_params)
	    render json: serialize_gym(@gym, options)
	  else
	    render json: @gym.errors, status: :unprocessable_entity
	  end
	end

	# DELETE /api/v1/gyms/1
	def destroy
	  @gym.destroy
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_gym
	    @gym = Gym.find(params[:id])
	  end

	  def set_list_gym
	  	@gym = GymService.find_by_slug_or_id(params[:id])
	  end

	  def serialize_gym query, options
	    GymSerializer.new(query, options).serializable_hash.to_json
	  end

	  # Only allow a trusted parameter "white list" through.
	  def gym_params
	    params.require(:gym).permit(:name, :email, :cnpj)
	  end

	  def options
	    @options ||= { include: %i[telephones locations users] } 
	  end
end
