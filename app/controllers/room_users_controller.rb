class RoomUsersController < ApplicationController
  before_action :set_room
  before_action :check_owner!

  def edit
  end

  def update
    @chat_room.user_ids = params[:chat_room][:user_ids]
    @chat_room.save!
    flash[:success] = "Saved!"
    redirect_to edit_room_user_path(@chat_room)
  end

  private

  def set_room
    @chat_room = ChatRoom.find_by(id: params[:id])
  end

  def check_owner!
    redirect_to root_path unless @chat_room.owner?(current_user)
  end
end