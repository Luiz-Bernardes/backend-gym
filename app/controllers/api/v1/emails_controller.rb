class Api::V1::EmailsController < Api::V1::ApplicationController
  before_action :set_email, only: [:show, :update, :destroy]

  # GET /api/v1/emails
  def index
    @emails = Email.all
    render json: serialize_email(@emails, options)
  end

  # GET /api/v1/emails/1
  def show
    render json: serialize_email(@email, options)
  end

  # POST /api/v1/emails
  def create
    @email = Email.new(email_params)

    if @email.save
      render json: serialize_email(@email, options), status: :created
    else
      render json: @email.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/emails/1
  def update
    if @email.update(email_params)
      render json: serialize_email(@email, options)
    else
      render json: @email.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/emails/1
  def destroy
    @email.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    def serialize_email query, options
      EmailSerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def email_params
      params.require(:email).permit(:address, :gym_id, :user_id)
    end

    def options
      @options ||= { include: %i[] } 
    end
end
