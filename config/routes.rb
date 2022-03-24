Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html    
  devise_for :users
  
  namespace :api do
    namespace :v1 do 
      resources :client
      resources :division
      resources :users
      resources :partsreplace
      post 'auth_user', to: 'authentications#authenticate_user'
      get "/divbelong/:id", to: "division#divbelong"
      resources :jobinfo
      get "totalamount", to: "jobinfo#total_amount"
      get "completed", to: "jobinfo#completed_jobwork"
      #resources :direct_uploads, only: [:create]
      post 'direct_uploads', to: 'activestorage/direct_uploads#create'
     # put '/rails/active_storage/disk/:encoded_token', to: 'activestorage/upload#update'
    end
  end  

end
