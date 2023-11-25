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

	# NESTED ATTRS
	accepts_nested_attributes_for :telephones, :locations

	# METHODS
	def admin?
		self.user_type == ADMIN
	end

	# OVERWRITE
	protected 
  def password_required? 
    false 
  end 
end
