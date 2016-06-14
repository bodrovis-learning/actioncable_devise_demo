Rails.application.routes.draw do
  devise_for :users

  root 'global_chats#index'

  mount ActionCable.server => '/cable'
end
