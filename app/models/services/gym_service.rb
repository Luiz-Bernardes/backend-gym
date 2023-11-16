class GymService
	def self.find_by_slug_or_id(params_id)
		gym_find_by_slug = Gym.find_by(slug: params_id)
    gym = gym_find_by_slug.present? ? gym_find_by_slug : Gym.find(params_id)
    return gym
	end
	
	def self.find_owner(gym)
		gym.users.find_by(user_type: ADMIN)
	end

	def self.find_users(gym, type)
		gym.users.where(user_type: type)
	end

	def self.count_users(gym, type)
		self.find_users(gym, type).count
	end
end