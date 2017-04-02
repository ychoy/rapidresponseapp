class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: "#{message.user.first_name} #{message.user.last_name}",
      #  avatar: (helpers.asset_path(message.user.avatar.thumb.url)),
        created_at: message.created_at
      head :ok
    else
       redirect_to conversations_path
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :conversation_id)
    end
end
