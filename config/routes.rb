Rails.application.routes.draw do
  root 'welcome#index'
  resources :items
  resources :lists
  resources :users, only: [:show]
  match "/auth/:provider/callback" => "sessions#create", :via => [:get], :as => :callback
  match "/signout" => "sessions#destroy", :via => [:get], :as => :signout
end
