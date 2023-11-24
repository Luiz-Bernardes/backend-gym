class Api::V1::PlansController < Api::V1::ApplicationController
  # before_action :authenticate_api_v1_user!
  before_action :set_plan, only: [:show, :update, :destroy]

  # GET /api/v1/plans
  def index
    @plans = Plan.all
    render json: serialize_plan(@plans, options)
  end

  # GET /api/v1/plans/1
  def show
    render json: serialize_plan(@plan, options)
  end

  # POST /api/v1/plans
  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      render json: serialize_plan(@plan, options), status: :created
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/plans/1
  def update
    if @plan.update(plan_params)
      render json: serialize_plan(@plan, options)
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/plans/1
  def destroy
    @plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    def serialize_plan query, options
      PlanSerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def plan_params
      params.require(:plan).permit(:name, :price)
    end

    def options
      @options ||= { include: %i[] } 
    end
end
