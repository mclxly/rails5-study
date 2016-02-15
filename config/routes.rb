Rails.application.routes.draw do
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
end
