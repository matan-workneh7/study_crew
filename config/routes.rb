Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  #root "users#index"

  resources :users
  resources :connections
  resources :courses
  resources :assistant_courses
  
  # Custom routes for assistant_courses
  get '/assistant_courses/by_assistant/:assistant_id', to: 'assistant_courses#by_assistant'
  get '/assistant_courses/by_course/:course_id', to: 'assistant_courses#by_course'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Catch-all for unknown routes (must be last)
  match '*unmatched', to: 'application#route_not_found', via: :all
end
