Rails.application.routes.draw do
  resources :events do
    get :join, to: 'events#join', as: 'join'
    get :accept_request, to: 'events#accept_request', as: 'accept_request'
    get :reject_request, to: 'events#reject_request', as: 'reject_request'    
  end

  get :my_events, to: 'events#my_events', as: 'my_events'

  resources :events
  resources :recipes
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  
  
  root to: "home#index"
  # match 'users/sign_out' => get "devise/sessions#destroy"

  get 'tags/:tag', to: 'events#index', as: :tag

end
