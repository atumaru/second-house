Rails.application.routes.draw do
 
  
  devise_for :users
 
  root to: "tweets#index"
  resources :tweets do
    
    resources :comments, only:[:create] 
    collection do
      get 'search'
    end
  end
  resources :chat_rooms  do
    collection do
      get 'search'
    end
  end
  resources :rooms,only:[:index,:new,:destroy,:create,:show]  do
    resources :messages,only:[:index,:create]
  end
  resources :events do
    resources :likes, only: [:create, :destroy]
  end
  resources :users,    only:[:show,:edit,:update]
  resources :prefecture_tweets,only:[:index]
  resources :event_adds,only:[:index]
 
  
end
