class ClientService
	def self.all_from current_user
		Client.where(gym_id: current_user.gym.id)
	end

	def self.save_for params, current_user
		client = Client.new(params)
    client.gym_id = current_user.gym.id
    client.save
    client
	end
end