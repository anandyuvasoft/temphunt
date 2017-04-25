class MessagesController < ApplicationController

  def index
    @messages = current_user.messages.order('created_at desc').first(5)
  end

  def create
    message = Message.new(message_params)
    if message.save
      UserMailer.send_message(message, current_user).deliver
      @response = {success:true}
    else
      @response = {success:false, errors: message.errors.full_messages}
    end
  end

  def message_params
    params.require(:message).permit(:body, :receiver_id, :sender_id)
  end

end
