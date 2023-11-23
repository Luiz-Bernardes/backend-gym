class Employee < User
	# SCOPE
	default_scope { where(user_type: EMPLOYEE) }

	# ASSOCIATIONS
	has_many :records

	# NESTED ATTRS
	accepts_nested_attributes_for :records

	# METHODS
	def delete
		EmployeeService.delete(self)
	end
end