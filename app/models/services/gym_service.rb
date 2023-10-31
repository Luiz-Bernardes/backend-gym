class GymService
	
	def self.find_by_slug_or_id(params_id)
		gym_find_by_slug = Gym.find_by(slug: params_id)
    
    if gym_find_by_slug.present?
    	gym = gym_find_by_slug
    else
    	gym = Gym.find(params_id)
    end

    return gym
	end

end