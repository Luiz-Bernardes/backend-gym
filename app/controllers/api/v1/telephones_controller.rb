class Api::V1::TelephonesController < Api::V1::ApplicationController
  # before_action :authenticate_api_v1_user!
  before_action :set_telephone, only: [:show, :update, :destroy]

  # GET /api/v1/telephones
  def index
    @telephones = Telephone.all
    render json: serialize_telephone(@telephones, options)
  end

  # GET /api/v1/telephones/1
  def show
    render json: serialize_telephone(@telephone, options)
  end

  # POST /api/v1/telephones
  def create
    @telephone = Telephone.new(telephone_params)

    if @telephone.save
      render json: serialize_telephone(@telephone, options), status: :created
    else
      render json: @telephone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/telephones/1
  def update
    if @telephone.update(telephone_params)
      render json: serialize_telephone(@telephone, options)
    else
      render json: @telephone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/telephones/1
  def destroy
    @telephone.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telephone
      @telephone = Telephone.find(params[:id])
    end

    def serialize_telephone query, options
      TelephoneSerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def telephone_params
      params.require(:telephone).permit(:number, :gym_id, :user_id)
    end

    def options
      @options ||= { include: %i[] } 
    end
end
