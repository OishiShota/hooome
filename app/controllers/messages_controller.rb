class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to home_path(@message.home)
    else
      @home = @message.home
      render "homes/show"
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:comment).merge(user_id: current_user.id, home_id: params[:home_id])
  end
end