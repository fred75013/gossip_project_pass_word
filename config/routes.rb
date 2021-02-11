Rails.application.routes.draw do

    root to:'home#index'
    get '/team', to: 'home#team'
    get '/contact', to: 'home#contact'
    get '/welcome(/:name)', to: 'home#index'
    resources :gossips do
      resources :comment
      resources :likes
    end
    resources :users
    resources :cities
    resources :sessions, only: [:new, :create, :destroy]

end
