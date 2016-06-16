# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from("chat_rooms_#{params['chat_room_id']}_channel") if permitted_for?(params['chat_room_id'])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id']) if permitted_for?(data['chat_room_id'])
  end

  private

  def permitted_for?(chat_room_id)
    chat_room = ChatRoom.find_by(id: chat_room_id)
    chat_room && chat_room.member?(current_user)
  end
end