class ConversationsController < ApplicationController
  before_action :set_conversation
  def index
    @conversations = Conversation.public_channels
  end

  def show
    @conversations = Conversation.all
    #includes method for eager loading
    @conversation = Conversation.includes(:messages).find_by(id: params[:id])
    @users = User.all
    #allows new messages to be created
    @message = Message.new
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:id)
  end

end
