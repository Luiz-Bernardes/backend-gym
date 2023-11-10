class Api::V1::UsersController < Api::V1::ApplicationController
  # before_action :authenticate_user!
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /api/v1/users
  def index
    @users = User.all
    render json: serialize_user(@users, options)
  end

  # GET /api/v1/users/1
  def show
    render json: serialize_user(@user, options)
  end

  # POST /api/v1/users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: serialize_user(@user, options), status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @user.update(user_params)
      render json: serialize_user(@user, options)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
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
      @options ||= { include: %i[telephones emails locations] } 
    end
end
