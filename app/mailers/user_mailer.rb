class UserMailer < ApplicationMailer
  def send_email(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(from: 'asaph.yuan@gmail.com',
         to: 'javier@badaboom.com',
         subject: 'New Visitor\'s Email')
  end
end
