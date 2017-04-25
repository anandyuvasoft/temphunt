class Message < ApplicationRecord

  validates_presence_of :body, :sender_id, :receiver_id

  def receiver
    User.find(self.receiver_id)
  end


end
