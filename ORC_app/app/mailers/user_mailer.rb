class UserMailer < ApplicationMailer
  default from: "leeann.mokoena@gmail.com"
 #user model sent in as an object to directly extract email(as shown below)
 def rental_confirmation(user)
   @user = user
   
   mail to: @user.email_address, subject: "Rental confirmation"
  end
end
