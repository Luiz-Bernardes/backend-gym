class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :update, :destroy]

  # GET /records
  def index
    @records = Record.all
    render json: serialize_record(@records, options)
  end

  # GET /records/1
  def show
    render json: serialize_record(@record, options)
  end

  # POST /records
  def create
    @record = Record.new(record_params)

    if @record.save
      render json: serialize_record(@record, options), status: :created, location: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /records/1
  def update
    if @record.update(record_params)
      render json: serialize_record(@record, options)
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /records/1
  def destroy
    @record.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    def serialize_record query, options
      RecordSerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def record_params
      params.require(:record).permit(
        :begin_date, 
        :end_date,
        :goal,
        :interval,
        :client_id,
        :employee_id,
        trainings_attributes: [
          :name,
          training_exercises_attributes: [:exercise_id]
        ]
      )
    end

    def options
      @options ||= { include: %i[trainings] } 
    end
end