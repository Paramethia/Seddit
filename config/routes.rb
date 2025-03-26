Rails.application.routes.draw do
  resources :seds do
    member do
      post 'ascend'
      post 'descend'
      post 'create_comment'
      delete 'delete_comment'
    end
  end
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}
  resources :subseddits do
    post 'join', to: 'memberships#create'
    delete 'leave', to: 'memberships#destroy'
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/search", to: "search#index"
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "seds#index"
end
