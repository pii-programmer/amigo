class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to chats_path #users#show作成後リダイレクト先をマイページへ変更
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:title, user_ids: [])
  end
end
