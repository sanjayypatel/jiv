Rails.application.routes.draw do
  root 'welcome#index'
  resources :items
  resources :lists
  resources :users, only: [:show]
  resources :listings, only: [:create, :update]
  match "/auth/:provider/callback" => "sessions#create", :via => [:get], :as => :callback
  match "/signout" => "sessions#destroy", :via => [:get], :as => :signout
  match "/tweetlist/:id" => "lists#post_to_twitter", :via => [:get], :as => :tweet_list
end
