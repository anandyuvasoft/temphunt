class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages, foreign_key: :sender_id       

  USER_TYPES = ["Trainee", "Trainer"]
  
  scope :all_except, ->(user) { where.not(id: user) }

  def messages
    Message.where(sender_id:self.id).or(Message.where(receiver_id:self.id))
  end

end
