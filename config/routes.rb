Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html    
  devise_for :users
  
  namespace :api do
    namespace :v1 do 
      resources :client
      resources :division
      resources :users
      resources :partsreplace
      resources :defect_details
      post 'auth_user', to: 'authentications#authenticate_user'
      get "/divbelong/:id", to: "division#divbelong"
      resources :jobinfo
      get "totalamount", to: "jobinfo#total_amount"
      get "completed", to: "jobinfo#completed_jobwork"
      #resources :direct_uploads, only: [:create]
      post '/rails/active_storage/direct_uploads', to: 'activestorage/direct_uploads#create'
      post '/upload', to: 'upload#create'
      post '/upload_attach', to: 'upload#attached_create'
      put '/rails/active_storage/disk/:encoded_token', to: 'activestorage/upload#update'
     
      #chart
      get "/outstanding/", to: "jobinfo#monthly_total_outstanding_chart"
      get "/outstandingcount/", to: "jobinfo#monthly_total_outstanding_chart_count"
    end
  end  

end
