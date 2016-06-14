# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GlobalChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "global_chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data) # this is the main method
    current_user.messages.create! body: data['message']
  end
end
