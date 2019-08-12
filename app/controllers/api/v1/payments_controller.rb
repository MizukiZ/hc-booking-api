module Api
  module V1

class PaymentsController < ApplicationController

 def create
    # get option price and convert it to cents
    option = Option.find(params[:optionId])
    price = option.price * 100
  begin
    # create a customer with email
    customer = Stripe::Customer.create(
      :email => params[:email],
      :source  => params[:tokenId]
    )

    # create a cherge with customer and amount
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => price.round,
      :description => option.title,
      :currency    => 'aud'
    )
    
    #create a patient if the email does not exist in database
    if Client.where(email: params[:email]).exists?
    client = Client.where(email: params[:email]).first
    else
    client = Client.create(
      first_name: params[:firstname],
      last_name: params[:lastname],
      email: params[:email],
      phone: params[:phone],
    )
    end

    # send confirmation email
    UserNotifierMailer.send_booking_confirmation_mail(client).deliver

    #create an appointment with the stripeID and CcientID
    appointment = Appointment.create(
      client_id: client.id,
      stripe_id: charge.id,
      option_id: option.id,
      content: params[:content],
      start_at: params[:start_at],
      end_at: params[:end_at]
    )

     # send confirmation email to admin
     UserNotifierMailer.send_booking_confirmation_mail_to_admin(appointment).deliver
    
   
    render json: { status: 'SUCCESS', message: "Success" }

  rescue Stripe::CardError => e
    render json: { status: 'FAIL', message: e.message }
  end
 end
end

end
end