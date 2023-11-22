class ClientService
	def self.all_from current_user
		Client.where(gym_id: current_user.gym.id, deleted: false)
	end

	def self.save_for params, current_user
		client = Client.new(params)
    client.gym_id = current_user.gym.id
    client.save
    client
	end

	def self.delete client
		client.deleted = true
		client.save
	end
end