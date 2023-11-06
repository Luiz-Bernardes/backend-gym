class Api::V1::TrainingExercisesController < Api::V1::ApplicationController
  before_action :set_training_exercise, only: [:show, :update, :destroy]

  # GET /api/v1/training_exercises
  def index
    @training_exercises = TrainingExercise.all
    render json: serialize_training_exercise(@training_exercises, options)
  end

  # GET /api/v1/training_exercises/1
  def show
    render json: serialize_training_exercise(@training_exercise, options)
  end

  # POST /api/v1/training_exercises
  def create
    @training_exercise = TrainingExercise.new(training_exercise_params)

    if @training_exercise.save
      render json: serialize_training_exercise(@training_exercise, options), status: :created
    else
      render json: @training_exercise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/training_exercises/1
  def update
    if @training_exercise.update(training_exercise_params)
      render json: serialize_training_exercise(@training_exercise, options)
    else
      render json: @training_exercise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/training_exercises/1
  def destroy
    @training_exercise.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_exercise
      @training_exercise = TrainingExercise.find(params[:id])
    end

    def serialize_training_exercise query, options
      TrainingExerciseSerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def training_exercise_params
      params.require(:training_exercise).permit(:training_id, :exercise_id)
    end

    def options
      @options ||= { include: %i[] } 
    end
end
