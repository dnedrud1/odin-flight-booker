class PassengerMailer < ActionMailer::Base
  default from: 'flight_notifications@example.com'
 
  def thank_you_email(email, booking)
    @email = email
    @url  = booking_url(:id => booking.id)
    mail(to: @email, subject: 'Thank you for booking your flight!', host: 'https://odin-flight-booker-dnedrud1.c9.io')
  end
end
