class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id

  def message_time
    created_at.strftime("%d/%m/%y at %l:%M %p")
  end

  def create_auto_message(user, recipient, conversation, instrument, rent)
    @instrument = instrument
    @rent = rent
    @user = user
    @recipient = recipient
    @conversation = conversation
    @body = "Hi #{@recipient.nickname}! I've rented your #{@instrument.name} from the #{@rent.start_time} to the #{@rent.end_time}!"
    @message = Message.new(user_id: @user.id, conversation_id: @conversation.id, body: @body)
    @message.save
  end
end
