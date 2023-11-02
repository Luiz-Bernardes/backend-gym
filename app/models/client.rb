class Client < User
	# VALIDATIONS
	validates :weight,:height, presence: true

	# SCOPE
	default_scope { where(user_type: 'client') }

	# ASSOCIATIONS
	has_many :records

	# NESTED ATTRS
	accepts_nested_attributes_for :records
end