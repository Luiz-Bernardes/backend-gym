class EmployeeService
	def self.all_from current_user
		Employee.where(gym_id: current_user.gym.id)
	end

	def self.save_for params, current_user
		employee = Employee.new(params)
    employee.gym_id = current_user.gym.id
    employee.save
    employee
	end
end