class PlanService
	def self.all_from current_user
		Plan.where(gym_id: current_user.gym.id, deleted: false)
	end

	def self.save_for params, current_user
		plan = Plan.new(params)
    plan.gym_id = current_user.gym.id
    plan.save
    plan
	end

	def self.delete plan
		plan.deleted = true
		plan.save
	end
end