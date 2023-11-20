class AppConfig < ApplicationRecord
  # CALLBACKS
  before_create :validate_singleton_state
	
	# ASSOCIATIONS
	belongs_to :gym

  # METHODS
  def self.medical_attributes_enabled?
    settings.medical_attributes
  end

  def self.gender_attribute_enabled?
    settings.gender_attribute
  end

  private
  def validate_singleton_state
    raise Exception.new("There can be only one per user.") if AppConfig.settings.present?
  end

  def self.settings
  	#TODO - FILTER BY LOGGED USERS
    find_by(gym_id: 1)
  end

end
