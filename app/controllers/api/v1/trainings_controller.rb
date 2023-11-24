class Api::V1::TrainingsController < Api::V1::ApplicationController
  # before_action :authenticate_api_v1_user!
  before_action :set_training, only: [:show, :update, :destroy]

  # GET /api/v1/records/:record_id/trainings
  def index
    @trainings = Training.where(record_id: params[:record_id])
    render json: serialize_training(@trainings, options)
  end

  # GET /api/v1/records/:record_id/trainings/1
  def show
    render json: serialize_training(@training, options)
  end

  # POST /api/v1/records/:record_id/trainings
  def create
    @training = Training.new(training_params)

    if @training.save
      render json: serialize_training(@training, options), status: :created
    else
      render json: @training.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/records/:record_id/trainings/1
  def update
    if @training.update(training_params)
      render json: serialize_training(@training, options)
    else
      render json: @training.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/records/:record_id/trainings/1
  def destroy
    @training.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find_by(
        id: params[:id], 
        record_id: params[:record_id]
      )
    end

    def serialize_training query, options
      TrainingSerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def training_params
      params.require(:training).permit(:name, :record_id)
    end

    def options
      @options ||= { include: %i[] } 
    end
end