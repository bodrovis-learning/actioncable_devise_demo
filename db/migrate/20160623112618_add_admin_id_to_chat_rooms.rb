class AddAdminIdToChatRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :admin_id, :integer
    add_index :chat_rooms, :admin_id
    remove_column :chat_rooms, :user_id
  end
end
