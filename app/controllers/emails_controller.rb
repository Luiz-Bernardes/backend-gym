class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :update, :destroy]

  # GET /emails
  def index
    @emails = Email.all
    render json: serialize_email(@emails, options)
  end

  # GET /emails/1
  def show
    render json: serialize_email(@email, options)
  end

  # POST /emails
  def create
    @email = Email.new(email_params)

    if @email.save
      render json: serialize_email(@email, options), status: :created, location: @email
    else
      render json: @email.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /emails/1
  def update
    if @email.update(email_params)
      render json: serialize_email(@email, options)
    else
      render json: @email.errors, status: :unprocessable_entity
    end
  end

  # DELETE /emails/1
  def destroy
    @email.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    def serialize_email query, options
      EmailSerializer.new(query, options).serialized_json
    end

    # Only allow a trusted parameter "white list" through.
    def email_params
      params.require(:email).permit(:address, :gym_id, :user_id)
    end

    def options
      @options ||= { include: %i[] } 
    end
end
