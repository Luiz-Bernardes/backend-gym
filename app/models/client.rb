class Client < User
	validates :weight,:height, presence: true
end