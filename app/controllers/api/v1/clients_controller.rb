class Api::V1::ClientsController < Api::V1::ApplicationController
  before_action :set_client, only: [:show, :update, :destroy]

  # GET /api/v1/clients
  def index
    @clients = Client.all
    render json: serialize_client(@clients, options)
  end

  # GET /api/v1/clients/1
  def show
    render json: serialize_client(@client, options)
  end

  # POST /api/v1/clients
  def create
    @client = Client.new(client_params)

    if @client.save
      render json: serialize_client(@client, options), status: :created
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/clients/1
  def update
    if @client.update(client_params)
      render json: serialize_client(@client, options)
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/clients/1
  def destroy
    @client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    def serialize_client query, options
      ClientSerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(
        :name, 
        :weight, 
        :height, 
        :birthdate, 
        :begindate, 
        :plan_id, 
        :gym_id, 
        :user_type,
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
      @options ||= { include: %i[telephones emails locations records] } 
    end
end