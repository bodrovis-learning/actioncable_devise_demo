class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :prepare_messages

  private

  def prepare_messages
    @messages = Message.order('created_at DESC')
    @message = Message.new
  end
end
