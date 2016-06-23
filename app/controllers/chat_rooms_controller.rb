class ChatRoomsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :authenticate_admin!, only: [:new, :create]
  before_action :set_room, only: [:show]
  before_action :check_member!, only: [:show]

  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_admin.owned_chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
    @message = Message.new
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end

  def set_room
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
  end

  def check_member!
    redirect_to root_path unless @chat_room.member?(current_user) || @chat_room.owner?(current_admin)
  end
end