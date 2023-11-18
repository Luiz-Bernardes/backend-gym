class Api::V1::PaymentsController < Api::V1::ApplicationController
  before_action :set_payment, only: [:show, :update, :destroy]

  # GET /api/v1/clients/:client_id/payments
  def index
    @payments = Payment.where(client_id: params[:client_id])
    render json: serialize_payment(@payments, options)
  end

  # GET /api/v1/clients/:client_id/payments/1
  def show
    render json: serialize_payment(@payment, options)
  end

  # POST /api/v1/clients/:client_id/payments
  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      render json: serialize_payment(@payment, options), status: :created
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/clients/:client_id/payments/1
  def update
    if @payment.update(payment_params)
      render json: serialize_payment(@payment, options)
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/clients/:client_id/payments/1
  def destroy
    @payment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find_by(
        id: params[:id], 
        client_id: params[:client_id]
      )
    end

    def serialize_payment query, options
      PaymentSerializer.new(query, options).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def payment_params
      params.require(:payment).permit(
        :value, 
        :amount_paid, 
        :payment_date, 
        :due_date, 
        :client_id, 
        :payment_method_id
      )
    end

    def options
      @options ||= { include: %i[] } 
    end
end