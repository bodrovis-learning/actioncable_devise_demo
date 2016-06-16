class AddChatRoomIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :chat_room_id, :integer
  end
end
