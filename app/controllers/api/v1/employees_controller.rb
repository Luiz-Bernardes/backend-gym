class Api::V1::EmployeesController < Api::V1::ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  # GET /api/v1/employees
  def index
    @employees = Employee.all
    render json: serialize_employee(@employees, options)
  end

  # GET /api/v1/employees/1
  def show
    render json: serialize_employee(@employee, options)
  end

  # POST /api/v1/employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: serialize_employee(@employee, options), status: :created
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/employees/1
  def update
    if @employee.update(employee_params)
      render json: serialize_employee(@employee, options)
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/employees/1
  def destroy
    @employee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def serialize_employee query, options
      EmployeeSerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params.require(:employee).permit(
        :name, 
        :email,
        :role, 
        :gym_id, 
        :user_type,
        telephones_attributes: [:number],
        locations_attributes: [
          :address,
          :number,
          :neighborhood,
          :complement,
          :city_id
        ]
      )
    end

    def options
      @options ||= { include: %i[telephones locations] } 
    end
end