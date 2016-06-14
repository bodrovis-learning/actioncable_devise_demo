class GlobalChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.order('created_at DESC')
    @message = Message.new
  end
end