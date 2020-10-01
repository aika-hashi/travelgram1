Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:edit, :update]

  resources :twitters,only: [:index, :show]
  resources :hotel_tweets
  resources :trip_tweets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
