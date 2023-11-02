class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :update, :destroy]

  # GET /records/:record_id/exercises
  def index
    @exercises = Exercise.where(record_id: params[:record_id])
    render json: serialize_exercise(@exercises, options)
  end

  # GET /records/:record_id/exercises/1
  def show
    render json: serialize_exercise(@exercise, options)
  end

  # POST /records/:record_id/exercises
  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      render json: serialize_exercise(@exercise, options), status: :created
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /records/:record_id/exercises/1
  def update
    if @exercise.update(exercise_params)
      render json: serialize_exercise(@exercise, options)
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /records/:record_id/exercises/1
  def destroy
    @exercise.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find_by(
        id: params[:id], 
        record_id: params[:record_id]
      )
    end

    def serialize_exercise query, options
      ExerciseSerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def exercise_params
      params.require(:exercise).permit(:name, :record_id)
    end

    def options
      @options ||= { include: %i[] } 
    end
end