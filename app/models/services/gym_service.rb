class GymService
	
	def self.find_by_slug_or_id(params_id)
		gym_find_by_slug = Gym.find_by(slug: params_id)
    gym = gym_find_by_slug.present? ? gym_find_by_slug : Gym.find(params_id)
    return gym
	end

end