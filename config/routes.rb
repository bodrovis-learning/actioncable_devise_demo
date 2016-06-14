Rails.application.routes.draw do
  devise_for :users

  mount ActionCable.server => '/cable'

  get '/other_page', to: 'pages#other_page', as: :other_page
  root 'pages#index'
end
