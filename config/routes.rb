Rails.application.routes.draw do

  devise_for :users
  root :to => 'messages#index'

  resources :messages, :only => [:index, :new, :create, :show]
  resources :contacts, :only => [:index, :new, :create, :show]
end
