class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  # GET /employees
  def index
    @employees = Employee.all
    render json: serialize_employee(@employees, options)
  end

  # GET /employees/1
  def show
    render json: serialize_employee(@employee, options)
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: serialize_employee(@employee, options), status: :created, location: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      render json: serialize_employee(@employee, options)
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def serialize_employee query, options
      EmployeeSerializer.new(query, options).serialized_json
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params.require(:employee).permit(:name, :role, :gym_id, :user_type)
    end

    def options
      @options ||= { include: %i[] } 
    end
end