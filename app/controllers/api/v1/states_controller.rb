class Api::V1::StatesController < Api::V1::ApplicationController
  before_action :set_state, only: [:show, :update, :destroy]

  # GET /api/v1/states
  def index
    @states = State.all
    render json: serialize_state(@states, options)
  end

  # GET /api/v1/states/1
  def show
    render json: serialize_state(@state, options)
  end

  # POST /api/v1/states
  def create
    @state = State.new(state_params)

    if @state.save
      render json: serialize_state(@state, options), status: :created
    else
      render json: @state.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/states/1
  def update
    if @state.update(state_params)
      render json: serialize_state(@state, options)
    else
      render json: @state.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/states/1
  def destroy
    @state.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    def serialize_state query, options
      StateSerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def state_params
      params.require(:state).permit(:name, :uf)
    end

    def options
      @options ||= { include: %i[cities] } 
    end
end