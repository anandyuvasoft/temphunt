class UserMailer < ApplicationMailer

  def send_message(message, from_user) 
    @to_user = message.receiver
    @from_user = from_user
    @message = message
    mail :to => @to_user.email, :subject => "A Message from #{from_user.email}"
  end

end
