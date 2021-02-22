class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      query = "UPDATE homes, messages SET homes.updated_at = messages.updated_at WHERE homes.id = #{@message.home.id} AND messages.id = #{@message.id}"
      ActiveRecord::Base.connection.execute(query)
      redirect_to home_path(@message.home)
    else
      @home = @message.home
      @messages = @home.messages
      render "homes/show"
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:comment).merge(user_id: current_user.id, home_id: params[:home_id])
  end
end