Rails.application.routes.draw do
  
  devise_for :users
  root to: "tweets#index"
  resources :tweets,only:[:index,:new,:create]
  resources :rooms,only:[:index,:new,:destroy,:create] do
    
   
    resources :messages,only:[:index,:create]
  end

end
