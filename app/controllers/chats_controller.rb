class ChatsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @chats = Chat.all
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(content: params[:chat][:content])
    if @chat.save
      ActionCable.server.broadcast 'chat_channel', content: @chat
    end
  end

  def introduce
  end

end