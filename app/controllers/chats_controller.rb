class ChatsController < ApplicationController
  def index
    @chats = Chat.includes(:user).order(id: "DESC")
  end

  def create
    chat = Chat.create(content: params[:content])
    render json:{chat: chat}
    #Chat.create(chat_params)
  end

  def introduce
  end

  #private
  #def chat_params
  #  params.require(:chat).permit(:content).merge(user_id: current_user.id)
  #end
end