Rails.application.routes.draw do
  devise_for :users

  mount ActionCable.server => '/cable'

  root 'global_chats#index'
end
