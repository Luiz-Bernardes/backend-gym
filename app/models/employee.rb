class Employee < User
	# SCOPE
	default_scope { where(user_type: 'employee') }

	# ASSOCIATIONS
	has_many :records
end