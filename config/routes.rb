Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html    
  devise_for :users
  
  namespace :api do
    namespace :v1 do 
      post 'auth_user', to: 'authentications#authenticate_user'
      resources :client
      resources :division
     end
  end  



end
