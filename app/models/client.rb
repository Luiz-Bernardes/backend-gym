class Client < User
	# VALIDATIONS
	validates :weight,:height, presence: true

	# SCOPE
	default_scope { where(user_type: CLIENT) }

	# ASSOCIATIONS
	has_many :records
	has_many :payments

	# NESTED ATTRS
	accepts_nested_attributes_for :records
end