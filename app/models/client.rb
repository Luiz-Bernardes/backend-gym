class Client < User
	validates :weight,:height, presence: true

	default_scope { where(user_type: 'client') }

	has_many :records
end