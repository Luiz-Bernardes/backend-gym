class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: serialize_user(@users, options)
  end

  # GET /users/1
  def show
    render json: serialize_user(@user, options)
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: serialize_user(@user, options), status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: serialize_user(@user, options)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def serialize_user query, options
      UserSerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(
        :name, 
        :gym_id,
        telephones_attributes: [:number],
        emails_attributes: [:address],
        locations_attributes: [
          :address,
          :number,
          :neighborhood,
          :complement,
          :city_id
        ]

      )
    end

    def options
      @options ||= { include: %i[] } 
    end
end
