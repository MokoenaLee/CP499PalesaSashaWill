class NotifierMailer < ActionMailer::Base
  default from: "leeann.mokoena@gmail.com"
  layout 'mailer'
  
  def instructions(user)
   @name = user.name

   mail to: user.email, subject: 'Rental confirmed'
  end
end
