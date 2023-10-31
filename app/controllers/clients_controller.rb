class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :update, :destroy]

  # GET /clients
  def index
    @clients = Client.all
    render json: serialize_client(@clients, options)
  end

  # GET /clients/1
  def show
    render json: serialize_client(@client, options)
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      render json: serialize_client(@client, options), status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: serialize_client(@client, options)
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    def serialize_client query, options
      ClientSerializer.new(query, options).serialized_json
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:name, :weight, :height, :birthdate, :begindate, :plan_id, :type)
    end

    def options
      @options ||= { include: %i[] } 
    end
end