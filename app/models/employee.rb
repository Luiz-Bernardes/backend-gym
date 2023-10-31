class Employee < User
	default_scope where(user_type: 'employee')
end