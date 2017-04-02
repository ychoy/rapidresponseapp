class MembershipsController < ApplicationController

  def index
    @user = current_user.user_id
    @conversations = Conversation.find_by_id(@user)
  end

  def create
    @conversation = Conversation.find(params[:chatroom_id])
    @conversation.users.push(current_user) unless @conversation.member?(current_user)
    redirect_to chatroom_path(@conversation)
  end

  def destroy
  	@conversation = Conversation.find(params[:chatroom_id])
  	@conversation.users.destroy(current_user)
  	redirect_to chatroom_path(@conversation)
  end

end
