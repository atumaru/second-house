Rails.application.routes.draw do
 
  
  devise_for :users
 
  root to: "tweets#index"
  resources :tweets,only:[:index,:new,:create,:show]
  resources :chat_rooms 
  resources :rooms,only:[:index,:new,:destroy,:create,:show]  do
    resources :messages,only:[:index,:create]
  end
  resources :events
  
  resources :prefecture_tweets,only:[:index]
  
end
