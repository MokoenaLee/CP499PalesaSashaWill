class NotifierMailer < ActionMailer::Base
  default from: "leeann.mokoena@gmail.com"
  layout 'mailer'
  
  def instructions(parameter)
   @name = parameter.first_name

   mail to: parameter.email_address, subject: 'Rental confirmed'
  end
end
