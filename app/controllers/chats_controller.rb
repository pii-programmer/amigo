class ChatsController < ApplicationController
  def index
    @chats = Chat.order(id: "DESC")
  end

  def create
    chat = Chat.create(content: params[:content])
    render json:{chat: chat}
  end
end
