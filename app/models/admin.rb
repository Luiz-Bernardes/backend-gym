class Admin < User
	# SCOPE
	default_scope { where(user_type: 'admin') }
end