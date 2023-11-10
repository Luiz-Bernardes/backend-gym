class User < ApplicationRecord
  # DEVISE MODULES
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
	
	# VALIDATIONS
	validates :name, :gym_id, presence: true

	# ASSOCIATIONS
	has_many :emails
	has_many :telephones
	has_many :locations
	belongs_to :gym
	belongs_to :plan, optional: true 

	# NESTED ATTRS
	accepts_nested_attributes_for :emails, :telephones, :locations

	# OVERWRITE
	protected 
  def password_required? 
    false 
  end 

  def email_required? 
    false 
  end 
end
