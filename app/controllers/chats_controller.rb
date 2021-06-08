class ChatsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @chats = Chat.includes(:user).order(id: "DESC")
  end

  def create
    chat = Chat.create(content: params[:content], user_id: current_user.id)
    render json:{chat: chat}
  end

  def introduce
  end

end