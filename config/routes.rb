Rails.application.routes.draw do
  
  
  devise_for :users
  resources :rooms,only:[:index,:new,:destroy,:create,:show]  do
    resources :messages,only:[:index,:create]
  end
  root to: "tweets#index"
  resources :tweets,only:[:index,:new,:create]
  resources :events
   

end
