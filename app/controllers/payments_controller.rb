class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    def success

    end

    def webhook
        # payment_id= params[:data][:object][:payment_intent]
        # payment = Stripe::PaymentIntent.retrieve(payment_id)
        # lunch_id = payment.metadata.lunch_id
        # user_id = payment.metadata.user_id
    
        # p "lunch id " + lunch_id
        # p "user id " + user_id
    
        # status 200
    end
end