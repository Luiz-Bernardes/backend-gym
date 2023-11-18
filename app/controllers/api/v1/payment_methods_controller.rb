class Api::V1::PaymentMethodsController < Api::V1::ApplicationController

	# GET /api/v1/payment_methods
	def index
	  @payment_methods = PaymentMethod.all
	  render json: serialize_payment_method(@payment_methods, options)
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def serialize_payment_method query, options
	    PaymentMethodSerializer.new(query, options).serializable_hash.to_json
	  end

	  def options
	    @options ||= { include: %i[] } 
	  end
end
