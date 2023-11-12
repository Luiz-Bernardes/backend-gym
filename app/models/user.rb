class User < ApplicationRecord
  # DEVISE MODULES
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  
	# VALIDATIONS
	validates :name, :email, :gym_id, presence: true

	# ASSOCIATIONS
	has_many :telephones
	has_many :locations
	belongs_to :gym
	belongs_to :plan, optional: true 

	# NESTED ATTRS
	accepts_nested_attributes_for :telephones, :locations

	# OVERWRITE
	protected 
  def password_required? 
    false 
  end 
end
