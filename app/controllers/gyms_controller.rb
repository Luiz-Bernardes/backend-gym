class GymsController < ApplicationController
	before_action :set_gym, only: [:show, :update, :destroy]

	# GET /gyms
	def index
	  @gyms = Gym.all
	  render json: serialize_gym(@gyms, options)
	end

	# GET /gyms/1
	def show
	  render json: serialize_gym(@gym, options)
	end

	# POST /gyms
	def create
	  @gym = Gym.new(gym_params)

	  if @gym.save
	    render json: serialize_gym(@gym, options), status: :created, location: @gym
	  else
	    render json: @gym.errors, status: :unprocessable_entity
	  end
	end

	# PATCH/PUT /gyms/1
	def update
	  if @gym.update(gym_params)
	    render json: serialize_gym(@gym, options)
	  else
	    render json: @gym.errors, status: :unprocessable_entity
	  end
	end

	# DELETE /gyms/1
	def destroy
	  @gym.destroy
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_gym
	    @gym = Gym.find(params[:id])
	  end

	  def serialize_gym query, options
	    GymSerializer.new(query, options).serialized_json
	  end

	  # Only allow a trusted parameter "white list" through.
	  def gym_params
	    params.require(:gym).permit(:name, :cnpj)
	  end

	  def options
	    @options ||= { include: %i[emails telephones locations users] } 
	  end
end
