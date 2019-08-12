class UserNotifierMailer < ApplicationMailer
  default :from => 'example@example.com'

  def send_booking_confirmation_mail(client)
    @client = client
    mail( :to => @client.email,
    :subject => 'ご予約ありがとうございます。' )
  end

  def send_booking_confirmation_mail_to_admin(appointment)
    @appointment = appointment
    @option = appointment.option
    @client = appointment.client
    # mail for admin user to confirm the appointment
    mail( :to => "6282@ait.nsw.edu.au",
    :subject => '予約を確認しました。' )
  end
end
