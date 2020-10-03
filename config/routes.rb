Rails.application.routes.draw do
  devise_for :users
  root to: 'hotel_tweets#index'

  resources :users

  resources :hotel_tweets
  resources :trip_tweets

  resources :hotel_tweets do
    resources :hotel_tweet_comments, only: :create
  end

  resources :trip_tweets do
    resources :trip_tweet_comments, only: :create
  end

  resources :hotel_tweets do
    resource :hotel_bookmarks, only: [:create, :destroy,:show]
  end

  resources :trip_tweets do
    resource :trip_bookmarks, only: [:create, :destroy,:show]
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
