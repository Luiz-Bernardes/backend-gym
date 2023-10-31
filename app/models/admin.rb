class Admin < User
	default_scope where(user_type: 'admin')
end