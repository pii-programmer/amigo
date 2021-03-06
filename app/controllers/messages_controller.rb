class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @user1 = User.find_by(id: @room.user_ids[0])
    @user2 = User.find_by(id: @room.user_ids[1])
    @messages = @room.messages.includes(:user).order(id: "DESC")
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user).order(id: "DESC")
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
