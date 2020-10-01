Rails.application.routes.draw do
  devise_for :users
  root to: 'hotel_tweets#index'

  resources :users

  resources :hotel_tweets
  resources :trip_tweets

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
