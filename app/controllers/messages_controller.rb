class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    @messages.map { |message|
      if message.user_id != current_user.id
        message.seen = true
        message.save
      end
    }
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      ConversationChannel.broadcast_to(
        @conversation,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to conversation_messages_path(@conversation, anchor: "message-#{@message.id}")
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id, :conversations)
  end
end
