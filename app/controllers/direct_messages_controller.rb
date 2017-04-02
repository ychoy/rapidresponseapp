class DirectMessagesController < ApplicationController

  def show
    users = [current_user, User.find(params[:id])]
    @conversation = Conversation.direct_message_for_users(users)
    @conversations = Conversation.all
    @users = User.all
    @message = Message.new
    @messages = @conversation.messages.order(created_at: :desc).limit(100).reverse
    @conversation_user = current_user.memberships.find_by(conversation_id: @conversation.id)
    render "conversations/show"
    end
end
