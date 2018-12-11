class RentalMailer < ApplicationMailer
  default from: "leeann.mokoena@gmail.com"
 #user model sent in as an object to directly extract email(as shown below)
 def rental_confirmation(rental)
   @rental = rental
   
   mail to: @rental.email_address, subject: "Rental confirmation"
  end
end
